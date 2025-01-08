resource "aws_subnet" "my_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_block
  map_public_ip_on_launch = var.has_public_ip
  availability_zone = var.availability_zone
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_route_table_association" "subnet_rt_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = var.rt_id
}
