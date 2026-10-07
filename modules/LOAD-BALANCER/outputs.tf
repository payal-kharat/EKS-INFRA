
output "LOAD_BALANCER_ROLE_ARN" {
  value = aws_iam_role.THIS.arn
}

output "LOAD_BALANCER_ROLE_NAME" {
  value = aws_iam_role.THIS.name
}

