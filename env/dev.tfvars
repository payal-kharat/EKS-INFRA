ENVIRONMENT  = "dev"
PROJECT_NAME = "app-1"

AWS_REGION = "us-east-1"
VPC_CIDR   = "10.10.0.0/16"

AVAILABILITY_ZONES = [
  "us-east-1a",
  "us-east-1b"
]

PUBLIC_SUBNET_CIDRS = [
  "10.10.1.0/24",
  "10.10.2.0/24"
]

PRIVATE_SUBNET_CIDRS = [
  "10.10.11.0/24",
  "10.10.12.0/24"
]

ENABLE_NAT_GATEWAY = true
COMMON_TAGS = {
  Project   = "app-1"
  ManagedBy = "Terraform"
}

EKS_CLUSTER_VERSION = "1.33"
NODE_INSTANCE_TYPES = [
  "t3.small"
]

NODE_DESIRED_SIZE = 2
NODE_MIN_SIZE     = 2
NODE_MAX_SIZE     = 3

BACKEND_REPOSITORY_NAME  = "app-1-dev-backend"
FRONTEND_REPOSITORY_NAME = "app-1-dev-frontend"
DB_REPOSITORY_NAME       = "app-1-dev-db"

IMAGE_TAG_MUTABILITY = "MUTABLE"
SCAN_ON_PUSH         = true

LOG_RETENTION_DAYS = 7