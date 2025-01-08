resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.private_key.public_key_openssh
}

resource "local_file" "private_key_file" {
  filename        = "${path.module}/${var.key_name}.pem"
  content         = tls_private_key.private_key.private_key_pem
  file_permission = "0400" # Ensures secure permissions for the private key file
}

resource "aws_ssm_parameter" "key_param" {
  name        = "/instance_keys/${var.key_name}"
  type        = "String"
  tier        = "Advanced" # Upgrade to the Advanced tier
  value       = base64encode(local_file.private_key_file.content)
}
