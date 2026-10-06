terraform {
  backend "s3" {
    bucket  = "eks-terraform-state09"
    key     = "eks-infrastructure/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}