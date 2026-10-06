output "BACKEND_REPOSITORY_URL" {
  value = aws_ecr_repository.BACKEND.repository_url
}

output "FRONTEND_REPOSITORY_URL" {
  value = aws_ecr_repository.FRONTEND.repository_url
}

output "DB_REPOSITORY_URL" {
  value = aws_ecr_repository.DB.repository_url
}

output "BACKEND_REPOSITORY_ARN" {
  value = aws_ecr_repository.BACKEND.arn
}

output "FRONTEND_REPOSITORY_ARN" {
  value = aws_ecr_repository.FRONTEND.arn
}

output "DB_REPOSITORY_ARN" {
  value = aws_ecr_repository.DB.arn
}