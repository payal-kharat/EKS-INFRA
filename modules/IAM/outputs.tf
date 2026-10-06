output "EKS_CLUSTER_ROLE_ARN" {
  description = "EKS cluster IAM role ARN"
  value       = aws_iam_role.EKS_CLUSTER.arn
}

output "EKS_CLUSTER_ROLE_NAME" {
  description = "EKS cluster IAM role name"
  value       = aws_iam_role.EKS_CLUSTER.name
}

output "EKS_NODE_ROLE_ARN" {
  description = "EKS node IAM role ARN"
  value       = aws_iam_role.EKS_NODE.arn
}

output "EKS_NODE_ROLE_NAME" {
  description = "EKS node IAM role name"
  value       = aws_iam_role.EKS_NODE.name
}