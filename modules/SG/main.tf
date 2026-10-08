resource "aws_security_group" "EKS_CLUSTER" {
  name        = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-eks-cluster-sg"
  description = "Security group for EKS cluster"
  vpc_id      = var.VPC_ID

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-eks-cluster-sg"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "EKS_CLUSTER_FROM_NODE" {
  security_group_id            = aws_security_group.EKS_CLUSTER.id
  referenced_security_group_id = aws_security_group.EKS_NODE.id

  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "EKS_CLUSTER_OUTBOUND" {
  security_group_id = aws_security_group.EKS_CLUSTER.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_security_group" "EKS_NODE" {
  name        = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-eks-node-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.VPC_ID

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-eks-node-sg"

      "kubernetes.io/cluster/${var.PROJECT_NAME}-${var.ENVIRONMENT}-cluster" = "owned"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "EKS_NODE_FROM_CLUSTER" {
  security_group_id            = aws_security_group.EKS_NODE.id
  referenced_security_group_id = aws_security_group.EKS_CLUSTER.id

  ip_protocol = "-1"
}



resource "aws_vpc_security_group_ingress_rule" "EKS_NODE_SELF" {
  security_group_id            = aws_security_group.EKS_NODE.id
  referenced_security_group_id = aws_security_group.EKS_NODE.id

  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "EKS_NODE_OUTBOUND" {
  security_group_id = aws_security_group.EKS_NODE.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}