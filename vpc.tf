module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_name = "task1-vpc"
  igw_name = "task1-igw"
  nat_gw_name = "task1-nat-gw"
  public_subnet_id = module.Public-Subnet1.subnet_id
  public_rt_name = "Public-rt"
  private_rt_name  = "Private-rt"
}
