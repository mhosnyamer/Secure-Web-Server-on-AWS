variable "vpc_id" {
  type = string
}

variable "public_subnet_name1" {
  type = string
}
variable "public_subnet_cidr_block1" {
  type = string
}

variable "private_subnet_name1" {
  type = string
}
variable "private_subnet_cidr_block1" {
  type = string
}

variable "public_subnet_name2" {
  type = string
}
variable "public_subnet_cidr_block2" {
  type = string
}

variable "private_subnet_name2" {
  type = string
}
variable "private_subnet_cidr_block2" {
  type = string
}

variable "availability_zone1" {
  type = string
}
variable "availability_zone2" {
  type = string
}


variable "public_rt_name" {
  type = string
}

variable "private_rt_name" {
  type = string
}

variable "aws_internet_gateway_id" {
  type = string
}

variable "aws_nat_gateway_id" {
  type = string
}
