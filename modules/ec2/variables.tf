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

variable "need_key" {
  type = bool
  default = false
}

