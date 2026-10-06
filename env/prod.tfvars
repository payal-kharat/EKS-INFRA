ENVIRONMENT  = "prod"
PROJECT_NAME = "employee-mgm"

AWS_REGION = "us-east-1"

VPC_CIDR = "10.40.0.0/16"

AVAILABILITY_ZONES = [
  "us-east-1a",
  "us-east-1b"
]

PUBLIC_SUBNET_CIDRS = [
  "10.40.1.0/24",
  "10.40.2.0/24"
]

PRIVATE_SUBNET_CIDRS = [
  "10.40.11.0/24",
  "10.40.12.0/24"
]

ENABLE_NAT_GATEWAY = true

COMMON_TAGS = {
  Project   = "employee-mgm"
  ManagedBy = "Terraform"
}

EKS_CLUSTER_VERSION = "1.33"

NODE_INSTANCE_TYPES = [
  "t3.small"
]

NODE_DESIRED_SIZE = 2
NODE_MIN_SIZE     = 2
NODE_MAX_SIZE     = 3

BACKEND_REPOSITORY_NAME  = "employee-mgm-prod-backend"
FRONTEND_REPOSITORY_NAME = "employee-mgm-prod-frontend"
DB_REPOSITORY_NAME       = "employee-mgm-prod-db"

IMAGE_TAG_MUTABILITY = "MUTABLE"

SCAN_ON_PUSH = true