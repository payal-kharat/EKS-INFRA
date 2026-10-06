variable "BACKEND_REPOSITORY_NAME" {
  type = string
}

variable "FRONTEND_REPOSITORY_NAME" {
  type = string
}

variable "DB_REPOSITORY_NAME" {
  type = string
}

variable "IMAGE_TAG_MUTABILITY" {
  type    = string
  default = "MUTABLE"

  validation {
    condition = contains(
      ["MUTABLE", "IMMUTABLE"],
      var.IMAGE_TAG_MUTABILITY
    )

    error_message = "IMAGE_TAG_MUTABILITY must be either MUTABLE or IMMUTABLE."
  }
}

variable "SCAN_ON_PUSH" {
  type    = bool
  default = true
}

variable "COMMON_TAGS" {
  type = map(string)
}