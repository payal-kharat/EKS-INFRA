output "VPC_ID" {
  description = "VPC ID"
  value       = aws_vpc.THIS.id
}

output "VPC_CIDR" {
  description = "VPC CIDR block"
  value       = aws_vpc.THIS.cidr_block
}

output "PUBLIC_SUBNET_IDS" {
  description = "Public subnet IDs"
  value       = aws_subnet.PUBLIC[*].id
}

output "PRIVATE_SUBNET_IDS" {
  description = "Private subnet IDs"
  value       = aws_subnet.PRIVATE[*].id
}

output "PUBLIC_SUBNET_CIDRS" {
  description = "Public subnet CIDR blocks"
  value       = aws_subnet.PUBLIC[*].cidr_block
}

output "PRIVATE_SUBNET_CIDRS" {
  description = "Private subnet CIDR blocks"
  value       = aws_subnet.PRIVATE[*].cidr_block
}

output "INTERNET_GATEWAY_ID" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.THIS.id
}

output "NAT_GATEWAY_ID" {
  description = "NAT Gateway ID"
  value       = var.ENABLE_NAT_GATEWAY ? aws_nat_gateway.THIS[0].id : null
}