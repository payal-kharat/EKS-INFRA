
variable "PROJECT_NAME" {
  type = string
}

variable "ENVIRONMENT" {
  type = string
}

variable "EKS_OIDC_PROVIDER_ARN" {
  type = string
}

variable "EKS_OIDC_PROVIDER" {
  type = string
}

variable "COMMON_TAGS" {
  type = map(string)
}

