variable "ENVIRONMENT" {
  description = "Environment name"
  type        = string
}

variable "PROJECT_NAME" {
  description = "Project name"
  type        = string
}

variable "EKS_CLUSTER_VERSION" {
  description = "EKS Kubernetes version"
  type        = string
}

variable "EKS_CLUSTER_ROLE_ARN" {
  description = "IAM role ARN for EKS cluster"
  type        = string
}

variable "EKS_NODE_ROLE_ARN" {
  description = "IAM role ARN for EKS worker nodes"
  type        = string
}

variable "PRIVATE_SUBNET_IDS" {
  description = "Private subnet IDs for EKS"
  type        = list(string)
}

variable "EKS_CLUSTER_SECURITY_GROUP_ID" {
  description = "Security group ID for EKS cluster"
  type        = string
}

variable "EKS_NODE_SECURITY_GROUP_ID" {
  description = "Security group ID for EKS worker nodes"
  type        = string
}

variable "NODE_GROUP_NAME" {
  description = "EKS managed node group name"
  type        = string
}

variable "NODE_INSTANCE_TYPES" {
  description = "EC2 instance types for EKS nodes"
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

variable "COMMON_TAGS" {
  description = "Common tags for EKS resources"
  type        = map(string)
  default     = {}
}