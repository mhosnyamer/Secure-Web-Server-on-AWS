resource "aws_security_group" "main-sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-inbound-rules" {
  for_each = { for i, rule in var.ingress_rules : i => rule }
  security_group_id = aws_security_group.main-sg.id
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_block
  description       = each.value.description

  depends_on = [aws_security_group.main-sg]
}

resource "aws_vpc_security_group_egress_rule" "sg-outbound-rules" {
  security_group_id = aws_security_group.main-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

