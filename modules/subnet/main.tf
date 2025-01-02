resource "aws_subnet" "public1" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidr_block1
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone1
  tags = {
    Name = var.public_subnet_name1
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidr_block2
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone2
  tags = {
    Name = var.public_subnet_name2
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.aws_internet_gateway_id
  }
  tags = {
    Name = var.public_rt_name
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public-rt.id
}
################################################################

resource "aws_subnet" "private1" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet_cidr_block1
  availability_zone = var.availability_zone1
  tags = {
    Name = var.private_subnet_name1
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet_cidr_block2
  availability_zone = var.availability_zone2
  tags = {
    Name = var.private_subnet_name2
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.aws_nat_gateway_id
  }
  tags = {
    Name = var.private_rt_name
  }
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-rt.id
}
