variable "ENVIRONMENT" {
  description = "Environment name"
  type        = string
}

variable "VPC_CIDR" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "AVAILABILITY_ZONES" {
  description = "Availability zones for the VPC"
  type        = list(string)
}

variable "PUBLIC_SUBNET_CIDRS" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "PRIVATE_SUBNET_CIDRS" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "ENABLE_NAT_GATEWAY" {
  description = "Whether to create a NAT Gateway"
  type        = bool
  default     = true
}

variable "COMMON_TAGS" {
  description = "Common tags for VPC resources"
  type        = map(string)
  default     = {}
}