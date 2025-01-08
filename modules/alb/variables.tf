variable "name" {
  type = string
  description = "Name of the ALB"
}

variable "internal" {
  type = bool
  description = "Whether the ALB is internal or internet-facing"
}

variable "subnets" {
  type = list(string)
  description = "List of subnet IDs"
}

variable "vpc_id" {
  type = string
}


variable "target_group_name" {
  type = string
  description = "Name of the target group"
}

variable "target_group_port" {
  type = number
  description = "Port for the target group"
}

variable "target_group_protocol" {
  type = string
  description = "Protocol for the target group"
}

variable "instance_ids" {
  type = list(string)
  description = "List of instance IDs"
}

variable "security_groups" {
  type = list(string)
  description = "List of security group IDs to associate with the ALB"
}