resource "aws_vpc" "main" {
  cidr_block =  var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Attach Internet Gateway to VPC
resource "aws_internet_gateway" "igw" {
  vpc_id             = aws_vpc.main.id
  tags = {
    Name = var.igw_name
  }
}

# Define EIP for NAT Gateway
resource "aws_eip" "eip_nat" {
  instance        = null
  domain          = "vpc"
  associate_with_private_ip = true
}

# Define NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = var.nat_gw_name
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.public_rt_name
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = {
    Name = var.private_rt_name
  }
}