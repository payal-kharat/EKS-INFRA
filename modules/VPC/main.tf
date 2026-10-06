resource "aws_vpc" "THIS" {
  cidr_block           = var.VPC_CIDR
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.ENVIRONMENT}-vpc"
    }
  )
}

resource "aws_internet_gateway" "THIS" {
  vpc_id = aws_vpc.THIS.id

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.ENVIRONMENT}-igw"
    }
  )
}

resource "aws_subnet" "PUBLIC" {
  count = length(var.PUBLIC_SUBNET_CIDRS)

  vpc_id                  = aws_vpc.THIS.id
  cidr_block              = var.PUBLIC_SUBNET_CIDRS[count.index]
  availability_zone       = var.AVAILABILITY_ZONES[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.ENVIRONMENT}-public-subnet-${count.index + 1}"

      "kubernetes.io/role/elb" = "1"
    }
  )
}

resource "aws_subnet" "PRIVATE" {
  count = length(var.PRIVATE_SUBNET_CIDRS)

  vpc_id            = aws_vpc.THIS.id
  cidr_block        = var.PRIVATE_SUBNET_CIDRS[count.index]
  availability_zone = var.AVAILABILITY_ZONES[count.index]

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.ENVIRONMENT}-private-subnet-${count.index + 1}"

      "kubernetes.io/role/internal-elb" = "1"
    }
  )
}

resource "aws_route_table" "PUBLIC" {
  vpc_id = aws_vpc.THIS.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.THIS.id
  }

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.ENVIRONMENT}-public-route-table"
    }
  )
}

resource "aws_route_table_association" "PUBLIC" {
  count = length(aws_subnet.PUBLIC)

  subnet_id      = aws_subnet.PUBLIC[count.index].id
  route_table_id = aws_route_table.PUBLIC.id
}

resource "aws_eip" "NAT" {
  count = var.ENABLE_NAT_GATEWAY ? 1 : 0

  domain = "vpc"

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.ENVIRONMENT}-nat-eip"
    }
  )
}

resource "aws_nat_gateway" "THIS" {
  count = var.ENABLE_NAT_GATEWAY ? 1 : 0

  allocation_id = aws_eip.NAT[0].id
  subnet_id     = aws_subnet.PUBLIC[0].id

  depends_on = [
    aws_internet_gateway.THIS
  ]

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.ENVIRONMENT}-nat-gateway"
    }
  )
}

resource "aws_route_table" "PRIVATE" {
  count = var.ENABLE_NAT_GATEWAY ? 1 : 0

  vpc_id = aws_vpc.THIS.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.THIS[0].id
  }

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = "${var.ENVIRONMENT}-private-route-table"
    }
  )
}

resource "aws_route_table_association" "PRIVATE" {
  count = var.ENABLE_NAT_GATEWAY ? length(aws_subnet.PRIVATE) : 0

  subnet_id      = aws_subnet.PRIVATE[count.index].id
  route_table_id = aws_route_table.PRIVATE[0].id
}