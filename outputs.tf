output "VPC_ID" {
  description = "VPC ID"
  value       = module.VPC.VPC_ID
}

output "VPC_CIDR" {
  description = "VPC CIDR"
  value       = module.VPC.VPC_CIDR
}

output "PUBLIC_SUBNET_IDS" {
  description = "Public subnet IDs"
  value       = module.VPC.PUBLIC_SUBNET_IDS
}

output "PRIVATE_SUBNET_IDS" {
  description = "Private subnet IDs"
  value       = module.VPC.PRIVATE_SUBNET_IDS
}

output "INTERNET_GATEWAY_ID" {
  description = "Internet Gateway ID"
  value       = module.VPC.INTERNET_GATEWAY_ID
}

output "NAT_GATEWAY_ID" {
  description = "NAT Gateway ID"
  value       = module.VPC.NAT_GATEWAY_ID
}

output "EKS_CLUSTER_SECURITY_GROUP_ID" {
  description = "EKS cluster security group ID"
  value       = module.SECURITY_GROUP.EKS_CLUSTER_SECURITY_GROUP_ID
}

output "EKS_NODE_SECURITY_GROUP_ID" {
  description = "EKS node security group ID"
  value       = module.SECURITY_GROUP.EKS_NODE_SECURITY_GROUP_ID
}

output "EKS_CLUSTER_SECURITY_GROUP_NAME" {
  description = "EKS cluster security group name"
  value       = module.SECURITY_GROUP.EKS_CLUSTER_SECURITY_GROUP_NAME
}

output "EKS_NODE_SECURITY_GROUP_NAME" {
  description = "EKS node security group name"
  value       = module.SECURITY_GROUP.EKS_NODE_SECURITY_GROUP_NAME
}

output "EKS_CLUSTER_ID" {
  description = "EKS cluster ID"
  value       = module.EKS.EKS_CLUSTER_ID
}

output "EKS_CLUSTER_NAME" {
  description = "EKS cluster name"
  value       = module.EKS.EKS_CLUSTER_NAME
}

output "EKS_CLUSTER_ARN" {
  description = "EKS cluster ARN"
  value       = module.EKS.EKS_CLUSTER_ARN
}

output "EKS_CLUSTER_ENDPOINT" {
  description = "EKS cluster endpoint"
  value       = module.EKS.EKS_CLUSTER_ENDPOINT
}

output "EKS_CLUSTER_VERSION" {
  description = "EKS Kubernetes version"
  value       = module.EKS.EKS_CLUSTER_VERSION
}

output "EKS_NODE_GROUP_NAME" {
  description = "EKS node group name"
  value       = module.EKS.EKS_NODE_GROUP_NAME
}

output "EKS_NODE_GROUP_ARN" {
  description = "EKS node group ARN"
  value       = module.EKS.EKS_NODE_GROUP_ARN
}

output "BACKEND_ECR_REPOSITORY_URL" {
  value = module.ECR.BACKEND_REPOSITORY_URL
}

output "FRONTEND_ECR_REPOSITORY_URL" {
  value = module.ECR.FRONTEND_REPOSITORY_URL
}

output "DB_ECR_REPOSITORY_URL" {
  value = module.ECR.DB_REPOSITORY_URL
}