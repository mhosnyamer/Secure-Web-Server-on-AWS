module "Public-sg" {
  source = "./modules/sg"
  sg_name = "Public-sg"
  sg_description = "enable ssh and http connection for public instances"
  vpc_id = module.vpc.vpc_id
  ingress_rules = [
      {
        from_port  = 22
        to_port    = 22
        ip_protocol = "tcp"
        cidr_block =  "0.0.0.0/0" 
        description = "Allow SSH access"
      },
      {
        from_port  = 80
        to_port    = 80
        ip_protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        description = "Allow HTTP access"
      }
    ]

}


module "Private-sg" {
  source = "./modules/sg"
  sg_name = "Private-sg"
  sg_description = "enable ssh for private instances"
  vpc_id = module.vpc.vpc_id
  ingress_rules = [
      {
        from_port  = 22
        to_port    = 22
        ip_protocol = "tcp"
        cidr_block =  "0.0.0.0/0" 
        description = "Allow SSH access"
      }
    ]

}

module "Bastion1" {
  source = "./modules/ec2"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.subnet-and-rt.public1_subnet_id
  sg-id = [module.Public-sg.sg-id]
  instance_name = "Bastion1"
}

module "Application1" {
  source = "./modules/ec2"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.subnet-and-rt.private1_subnet_id
  sg-id = [module.Private-sg.sg-id]
  instance_name = "Application1"
}
