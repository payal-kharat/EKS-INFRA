module "VPC" {
  source = "./modules/VPC"

  ENVIRONMENT          = var.ENVIRONMENT
  VPC_CIDR             = var.VPC_CIDR
  AVAILABILITY_ZONES   = var.AVAILABILITY_ZONES
  PUBLIC_SUBNET_CIDRS  = var.PUBLIC_SUBNET_CIDRS
  PRIVATE_SUBNET_CIDRS = var.PRIVATE_SUBNET_CIDRS
  ENABLE_NAT_GATEWAY   = var.ENABLE_NAT_GATEWAY
  COMMON_TAGS          = var.COMMON_TAGS
}

module "IAM" {
  source                = "./modules/IAM"
  ENVIRONMENT           = var.ENVIRONMENT
  PROJECT_NAME          = var.PROJECT_NAME
  COMMON_TAGS           = var.COMMON_TAGS
  EKS_OIDC_PROVIDER_ARN = module.EKS.OIDC_PROVIDER_ARN
  EKS_OIDC_PROVIDER     = module.EKS.OIDC_PROVIDER

}

module "SECURITY_GROUP" {
  source       = "./modules/SG"
  ENVIRONMENT  = var.ENVIRONMENT
  PROJECT_NAME = var.PROJECT_NAME
  VPC_ID       = module.VPC.VPC_ID
  COMMON_TAGS  = var.COMMON_TAGS
}

module "EKS" {
  source                        = "./modules/EKS"
  ENVIRONMENT                   = var.ENVIRONMENT
  PROJECT_NAME                  = var.PROJECT_NAME
  EKS_CLUSTER_VERSION           = var.EKS_CLUSTER_VERSION
  EKS_CLUSTER_ROLE_ARN          = module.IAM.EKS_CLUSTER_ROLE_ARN
  EKS_NODE_ROLE_ARN             = module.IAM.EKS_NODE_ROLE_ARN
  PRIVATE_SUBNET_IDS            = module.VPC.PRIVATE_SUBNET_IDS
  EKS_CLUSTER_SECURITY_GROUP_ID = module.SECURITY_GROUP.EKS_CLUSTER_SECURITY_GROUP_ID
  EKS_NODE_SECURITY_GROUP_ID    = module.SECURITY_GROUP.EKS_NODE_SECURITY_GROUP_ID
  NODE_GROUP_NAME               = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-node-group"
  NODE_INSTANCE_TYPES           = var.NODE_INSTANCE_TYPES
  NODE_DESIRED_SIZE             = var.NODE_DESIRED_SIZE
  NODE_MIN_SIZE                 = var.NODE_MIN_SIZE
  NODE_MAX_SIZE                 = var.NODE_MAX_SIZE
  COMMON_TAGS                   = var.COMMON_TAGS
}

module "ECR" {
  source = "./modules/ECR"

  BACKEND_REPOSITORY_NAME  = var.BACKEND_REPOSITORY_NAME
  FRONTEND_REPOSITORY_NAME = var.FRONTEND_REPOSITORY_NAME
  DB_REPOSITORY_NAME       = var.DB_REPOSITORY_NAME
  IMAGE_TAG_MUTABILITY     = var.IMAGE_TAG_MUTABILITY
  SCAN_ON_PUSH             = var.SCAN_ON_PUSH
  COMMON_TAGS              = var.COMMON_TAGS
}

module "EBS_CSI_DRIVER" {
  source           = "./modules/EBS-CSI-DRIVER"
  EKS_CLUSTER_NAME = module.EKS.CLUSTER_NAME
  EBS_CSI_ROLE_ARN = module.IAM.EBS_CSI_ROLE_ARN
  PROJECT_NAME     = var.PROJECT_NAME
  ENVIRONMENT      = var.ENVIRONMENT
  COMMON_TAGS      = var.COMMON_TAGS
}


module "CLOUDWATCH" {
  source             = "./modules/CLOUD-WATCH"
  PROJECT_NAME       = var.PROJECT_NAME
  ENVIRONMENT        = var.ENVIRONMENT
  COMMON_TAGS        = var.COMMON_TAGS
  LOG_RETENTION_DAYS = var.LOG_RETENTION_DAYS
}

module "EKS_ADDONS" {
  source           = "./modules/EKS-ADD-ONS"
  EKS_CLUSTER_NAME = module.EKS.CLUSTER_NAME
  EBS_CSI_ROLE_ARN = module.IAM.EBS_CSI_ROLE_ARN
  PROJECT_NAME     = var.PROJECT_NAME
  ENVIRONMENT      = var.ENVIRONMENT
  COMMON_TAGS      = var.COMMON_TAGS
}

module "LOAD_BALANCER" {
  source = "./modules/LOAD-BALANCER"

  PROJECT_NAME          = var.PROJECT_NAME
  ENVIRONMENT           = var.ENVIRONMENT
  EKS_OIDC_PROVIDER_ARN = module.EKS.OIDC_PROVIDER_ARN
  EKS_OIDC_PROVIDER     = module.EKS.OIDC_PROVIDER
  COMMON_TAGS           = var.COMMON_TAGS
}





