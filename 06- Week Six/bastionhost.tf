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

resource "aws_instance" "forgtechbastion-host" {
  ami                    = var.environment[5]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.forgtech-public-subnet-a.id
  vpc_security_group_ids = [aws_security_group.forgtech-bastion-sg.id]
  key_name = aws_key_pair.forgtech_key_pair.key_name  # Attach key pair here
  associate_public_ip_address = true 
  tags = {
    Name  = "forgtech-bastion-host"
    Environment = var.environment[0]
    Owner  = var.environment[1]
  }
}
