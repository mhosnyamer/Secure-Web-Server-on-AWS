module "Private-alb-sg" {
  source = "./modules/sg"
  sg_name = "Private-alb-sg"
  sg_description = "enable inbound http rule for internal load balancer"
  vpc_id = module.vpc.vpc_id
  ingress_rules = [
      {
        from_port  = 80
        to_port    = 80
        ip_protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        description = "Allow HTTP access"
      }
    ]
}

module "private-alb" {
  source  = "./modules/alb"

  name                 = "private-alb"
  internal             = true
  subnets              = [module.Private-Subnet1.subnet_id,module.Private-Subnet2.subnet_id]
  target_group_name    = "private-target-group"
  target_group_port    = 80
  target_group_protocol = "HTTP"
  vpc_id = module.vpc.vpc_id
  instance_ids         = [module.Application1.instance_id, module.Application2.instance_id]
  security_groups = [module.Private-alb-sg.sg-id]
  
  depends_on = [ 
    module.Application1,
    module.Application2,
    module.Private-alb-sg
   ]

}

module "Public-alb-sg" {
  source = "./modules/sg"
  sg_name = "Public-alb-sg"
  sg_description = "enable inbound http rule for internet facing load balancer"
  vpc_id = module.vpc.vpc_id
  ingress_rules = [
      {
        from_port  = 80
        to_port    = 80
        ip_protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        description = "Allow HTTP access"
      }
    ]
}

module "internet-facing-alb" {
  source  = "./modules/alb"

  name                 = "internet-facing-alb"
  internal             = false
  subnets              = [module.Public-Subnet1.subnet_id,module.Public-Subnet2.subnet_id]
  target_group_name    = "public-target-group"
  target_group_port    = 80
  target_group_protocol = "HTTP"
  vpc_id = module.vpc.vpc_id
  instance_ids         = [module.Bastion1.instance_id, module.Bastion2.instance_id]
  security_groups = [module.Public-alb-sg.sg-id]

  depends_on = [ 
    module.Bastion1,
    module.Bastion2,
    module.Public-alb-sg
   ]
}