resource "aws_eks_cluster" "THIS" {
  name     = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-cluster"
  role_arn = var.EKS_CLUSTER_ROLE_ARN
  version  = var.EKS_CLUSTER_VERSION

  vpc_config {
    subnet_ids = var.PRIVATE_SUBNET_IDS

    security_group_ids = [
      var.EKS_CLUSTER_SECURITY_GROUP_ID
    ]

    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-cluster"
    }
  )
}

resource "aws_eks_node_group" "THIS" {
  cluster_name = aws_eks_cluster.THIS.name

  node_group_name = var.NODE_GROUP_NAME

  node_role_arn = var.EKS_NODE_ROLE_ARN

  subnet_ids = var.PRIVATE_SUBNET_IDS

  instance_types = var.NODE_INSTANCE_TYPES

  capacity_type = "ON_DEMAND"

  scaling_config {
    desired_size = var.NODE_DESIRED_SIZE
    min_size     = var.NODE_MIN_SIZE
    max_size     = var.NODE_MAX_SIZE
  }

  update_config {
    max_unavailable = 1
  }

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-node-group"
    }
  )

  depends_on = [
    aws_eks_cluster.THIS
  ]
}