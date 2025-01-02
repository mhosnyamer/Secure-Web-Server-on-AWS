variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "vpc_id" {
  type = string
}


variable "ingress_rules" {
  type = list(object({
    from_port  = number
    to_port    = number
    ip_protocol = string
    cidr_block = string 
    description = string # Optional description
  }))

}