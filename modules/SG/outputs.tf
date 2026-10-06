output "EKS_CLUSTER_SECURITY_GROUP_ID" {
  description = "EKS cluster security group ID"
  value       = aws_security_group.EKS_CLUSTER.id
}

output "EKS_CLUSTER_SECURITY_GROUP_NAME" {
  description = "EKS cluster security group name"
  value       = aws_security_group.EKS_CLUSTER.name
}

output "EKS_NODE_SECURITY_GROUP_ID" {
  description = "EKS node security group ID"
  value       = aws_security_group.EKS_NODE.id
}

output "EKS_NODE_SECURITY_GROUP_NAME" {
  description = "EKS node security group name"
  value       = aws_security_group.EKS_NODE.name
}