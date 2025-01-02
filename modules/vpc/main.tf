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