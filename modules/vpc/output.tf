output "vpc_id" {
  value = aws_vpc.main.id
}

output "eip_nat_id" {
  value = aws_eip.eip_nat.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gw_id" {
  value = aws_nat_gateway.main.id
}

output "public_rt_id" {
  value = aws_route_table.public-rt.id
}

output "private_rt_id" {
  value = aws_route_table.private-rt.id
}