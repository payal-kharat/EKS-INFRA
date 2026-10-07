variable "ENVIRONMENT" {
  description = "Environment name"
  type        = string
}

variable "PROJECT_NAME" {
  description = "Project name"
  type        = string
}

variable "COMMON_TAGS" {
  description = "Common tags for IAM resources"
  type        = map(string)
  default     = {}
}

#EBS
variable "EKS_OIDC_PROVIDER_ARN" {
  type = string
}
variable "EKS_OIDC_PROVIDER" {
  type = string
}

