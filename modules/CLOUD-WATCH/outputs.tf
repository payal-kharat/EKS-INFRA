
output "EKS_CLUSTER_LOG_GROUP_NAME" {
  value = aws_cloudwatch_log_group.EKS_CLUSTER.name
}

output "APPLICATION_LOG_GROUP_NAME" {
  value = aws_cloudwatch_log_group.APPLICATION.name
}

output "SYSTEM_LOG_GROUP_NAME" {
  value = aws_cloudwatch_log_group.SYSTEM.name
}

