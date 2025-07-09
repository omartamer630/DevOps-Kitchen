resource "tls_private_key" "forgtech_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "forgtech_key_pair" {
  key_name   = "forgtech-key"
  public_key = tls_private_key.forgtech_key.public_key_openssh
}

output "private_key_pem" {
  value     = tls_private_key.forgtech_key.private_key_pem
  sensitive = true
}

resource "local_file" "private_key" {
  content  = tls_private_key.forgtech_key.private_key_pem
  filename = "${path.module}/forgtech-key.pem"
}
