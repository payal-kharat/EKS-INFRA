variable "PROJECT_NAME" {
  type = string
}

variable "ENVIRONMENT" {
  type = string
}

variable "CLUSTER_NAME" {
  type = string
}

variable "AWS_REGION" {
  type = string
}

variable "VPC_ID" {
  type = string
}

variable "EKS_OIDC_PROVIDER_ARN" {
  type = string
}

variable "EKS_OIDC_PROVIDER" {
  type = string
}

variable "COMMON_TAGS" {
  type    = map(string)
  default = {}
}
variable "IAM_ROLE_ARN" {
  description = "Existing IAM role ARN for AWS Load Balancer Controller"
  type        = string
}

