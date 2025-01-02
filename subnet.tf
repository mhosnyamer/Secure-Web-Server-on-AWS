module "subnet-and-rt" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  
  public_subnet_cidr_block1 = "10.0.0.0/24"
  public_subnet_name1 = "Public-Subnet1"
  availability_zone1 = var.az1
  private_subnet_cidr_block1 = "10.0.1.0/24"
  private_subnet_name1 = "Private-Subnet1"

  public_subnet_cidr_block2 = "10.0.2.0/24"
  public_subnet_name2 = "Public-Subnet2"
  private_subnet_cidr_block2 = "10.0.3.0/24"
  private_subnet_name2 = "Private-Subnet2"
  availability_zone2 = var.az2

  public_rt_name = "Public-rt"
  private_rt_name  = "Private-rt"
  
  aws_internet_gateway_id = module.vpc.igw_id
  aws_nat_gateway_id = module.vpc.nat_gw_id

}  





