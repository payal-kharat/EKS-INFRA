resource "aws_iam_role" "EKS_CLUSTER" {
  name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "eks.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-eks-cluster-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "EKS_CLUSTER_POLICY" {
  role = aws_iam_role.EKS_CLUSTER.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "EKS_NODE" {
  name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-eks-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-eks-node-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "EKS_NODE_WORKER_POLICY" {
  role = aws_iam_role.EKS_NODE.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "EKS_NODE_CNI_POLICY" {
  role = aws_iam_role.EKS_NODE.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "EKS_NODE_ECR_POLICY" {
  role = aws_iam_role.EKS_NODE.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role" "EBS_CSI" {
  name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-ebs-csi-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = var.EKS_OIDC_PROVIDER_ARN
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "${var.EKS_OIDC_PROVIDER}:aud" = "sts.amazonaws.com"
            "${var.EKS_OIDC_PROVIDER}:sub" = "system:serviceaccount:kube-system:ebs-csi-controller-sa"
          }
        }
      }
    ]
  })
  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-ebs-csi-role"
    }
  )
}
resource "aws_iam_role_policy_attachment" "EBS_CSI" {
  role       = aws_iam_role.EBS_CSI.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

