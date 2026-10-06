variable "ENVIRONMENT" {
  description = "Deployment environment"
  type        = string

  validation {
    condition = contains(
      ["dev", "qa", "uat", "prod"],
      var.ENVIRONMENT
    )

    error_message = "ENVIRONMENT must be dev, qa, uat, or prod."
  }
}

variable "AWS_REGION" {
  description = "AWS region"
  type        = string
}

variable "PROJECT_NAME" {
  description = "Project name"
  type        = string
}

variable "VPC_CIDR" {
  description = "VPC CIDR block"
  type        = string
}

variable "AVAILABILITY_ZONES" {
  description = "Availability zones"
  type        = list(string)
}

variable "PUBLIC_SUBNET_CIDRS" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "PRIVATE_SUBNET_CIDRS" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "ENABLE_NAT_GATEWAY" {
  description = "Enable NAT Gateway"
  type        = bool
}

variable "COMMON_TAGS" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "EKS_CLUSTER_VERSION" {
  description = "EKS Kubernetes version"
  type        = string
}

variable "NODE_INSTANCE_TYPES" {
  description = "EKS worker node instance types"
  type        = list(string)
}

variable "NODE_DESIRED_SIZE" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "NODE_MIN_SIZE" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "NODE_MAX_SIZE" {
  description = "Maximum number of worker nodes"
  type        = number
}


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