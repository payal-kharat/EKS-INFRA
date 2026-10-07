
variable "PROJECT_NAME" {
  type = string
}

variable "ENVIRONMENT" {
  type = string
}

variable "COMMON_TAGS" {
  type = map(string)
}

variable "LOG_RETENTION_DAYS" {
  type = number
}

