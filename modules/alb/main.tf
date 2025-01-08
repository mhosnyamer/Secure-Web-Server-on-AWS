resource "aws_alb" "my_alb" {
  name     = var.name
  internal = var.internal
  subnets  = var.subnets
  security_groups = var.security_groups
}

resource "aws_alb_target_group" "my_alb" {
  name       = var.target_group_name
  port       = var.target_group_port
  protocol   = var.target_group_protocol
  vpc_id     = var.vpc_id
  target_type = "instance" 
}

resource "aws_alb_target_group_attachment" "my_alb" {
  for_each = { for i, rule in var.instance_ids : i => rule } 
  target_group_arn = aws_alb_target_group.my_alb.arn
  target_id       = each.value
  port            = var.target_group_port
}

resource "aws_alb_listener" "my_alb" {
  load_balancer_arn = aws_alb.my_alb.arn
  port              = var.target_group_port
  protocol          = var.target_group_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.my_alb.arn
  }
}