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

module "Application1" {
  source = "./modules/ec2"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.Private-Subnet1.subnet_id
  sg-id = [module.Private-sg.sg-id]
  key_name = module.key_application1.key_name
  instance_name = "Application1"
  userdata_template_path = "/userdata_files/application_userdata.tpl/"
  internal_alb_dns = ""

  depends_on = [ module.Private-sg ]
}


module "Application2" {
  source = "./modules/ec2"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.Private-Subnet2.subnet_id
  sg-id = [module.Private-sg.sg-id]
  key_name = module.key_application2.key_name
  instance_name = "Application2"
  userdata_template_path = "/userdata_files/application_userdata.tpl"
  internal_alb_dns = ""
  depends_on = [ module.Private-sg ]
}

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

module "Bastion1" {
  source = "./modules/ec2"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.Public-Subnet1.subnet_id
  sg-id = [module.Public-sg.sg-id]
  key_name = module.key_bastion1.key_name
  instance_name = "Bastion1"
  userdata_template_path = "/userdata_files/bastion_userdata.tpl"
  internal_alb_dns = module.private-alb.dns_name

  depends_on = [ 
    module.Public-sg,
    module.private-alb ]
}

module "Bastion2" {
  source = "./modules/ec2"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.Public-Subnet2.subnet_id
  sg-id = [module.Public-sg.sg-id]
  key_name = module.key_bastion2.key_name
  instance_name = "Bastion2"
  userdata_template_path = "/userdata_files/bastion_userdata.tpl"
  internal_alb_dns = module.private-alb.dns_name
  
  depends_on = [ 
    module.Public-sg,
    module.private-alb ]
}


# module "Application3" {
#   source = "./modules/ec2"
#   ami = var.ami_id
#   instance_type = var.instance_type
#   subnet_id = module.Private-Subnet2.subnet_id
#   sg-id = [module.Private-sg.sg-id]
#   key_name = module.key_application2.key_name
#   instance_name = "Application3"
#   userdata_template_path = null
#   internal_alb_dns = ""
#   depends_on = [ module.Private-sg ]
# }