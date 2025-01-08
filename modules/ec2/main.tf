resource "aws_instance" "instance" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.sg-id
    key_name = var.key_name
    tags = {
        Name = var.instance_name
    }


    # user_data = var.user_data
    user_data = var.userdata_template_path != null ? templatefile("${path.root}/${var.userdata_template_path}", {
        instance_name = var.instance_name
        internal_dns  = var.internal_alb_dns
    }) : null
}
