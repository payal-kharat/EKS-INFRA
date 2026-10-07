
resource "aws_cloudwatch_log_group" "EKS_CLUSTER" {
  name              = "/aws/eks/${var.PROJECT_NAME}-${var.ENVIRONMENT}/cluster"
  retention_in_days = var.LOG_RETENTION_DAYS

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-eks-cluster-logs"
    }
  )
}
resource "aws_cloudwatch_log_group" "APPLICATION" {
  name              = "/aws/eks/${var.PROJECT_NAME}-${var.ENVIRONMENT}/application"
  retention_in_days = var.LOG_RETENTION_DAYS

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-application-logs"
    }
  )
}
resource "aws_cloudwatch_log_group" "SYSTEM" {
  name              = "/aws/eks/${var.PROJECT_NAME}-${var.ENVIRONMENT}/system"
  retention_in_days = var.LOG_RETENTION_DAYS

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-system-logs"
    }
  )
}

