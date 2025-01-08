variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "sg-id" {
    type = list(string)
}


variable "instance_name" {
    type = string
}

variable "key_name" {
  type =  string
}

variable "userdata_template_path" {
  type = string
}

variable "internal_alb_dns" {
  type = string
}
