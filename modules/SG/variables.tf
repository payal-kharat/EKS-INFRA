variable "ENVIRONMENT" {
  description = "Environment name"
  type        = string
}

variable "PROJECT_NAME" {
  description = "Project name"
  type        = string
}

variable "VPC_ID" {
  description = "VPC ID"
  type        = string
}

variable "COMMON_TAGS" {
  description = "Common tags for security groups"
  type        = map(string)
  default     = {}
}