module "Public-Subnet1" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnet_name = "Public-Subnet1"
  subnet_cidr_block = "10.0.0.0/24"
  has_public_ip = true
  availability_zone = var.az1
  rt_id = module.vpc.public_rt_id
}

module "Private-Subnet1" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnet_name = "Private-Subnet1"
  subnet_cidr_block = "10.0.1.0/24"
  has_public_ip = false
  availability_zone = var.az1
  rt_id = module.vpc.private_rt_id
}

module "Public-Subnet2" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnet_name = "Public-Subnet2"
  subnet_cidr_block = "10.0.2.0/24"
  has_public_ip = true
  availability_zone = var.az2
  rt_id = module.vpc.public_rt_id
}

module "Private-Subnet2" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnet_name = "Private-Subnet2"
  subnet_cidr_block = "10.0.3.0/24"
  has_public_ip = false
  availability_zone = var.az2
  rt_id = module.vpc.private_rt_id
}