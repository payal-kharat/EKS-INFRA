output "EKS_CLUSTER_ID" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.THIS.id
}

output "EKS_CLUSTER_NAME" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.THIS.name
}

output "EKS_CLUSTER_ARN" {
  description = "EKS cluster ARN"
  value       = aws_eks_cluster.THIS.arn
}

output "EKS_CLUSTER_ENDPOINT" {
  description = "EKS cluster API endpoint"
  value       = aws_eks_cluster.THIS.endpoint
}

output "EKS_CLUSTER_VERSION" {
  description = "EKS Kubernetes version"
  value       = aws_eks_cluster.THIS.version
}

output "EKS_CLUSTER_CA_DATA" {
  description = "EKS cluster certificate authority data"
  value       = aws_eks_cluster.THIS.certificate_authority[0].data
}

output "EKS_NODE_GROUP_NAME" {
  description = "EKS node group name"
  value       = aws_eks_node_group.THIS.node_group_name
}

output "EKS_NODE_GROUP_ARN" {
  description = "EKS node group ARN"
  value       = aws_eks_node_group.THIS.arn
}