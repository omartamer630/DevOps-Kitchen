resource "aws_key_pair" "forgtech-key-pair" {
  key_name   = "forgtech-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "forgtechbastion-host" {
  ami                    = var.environment[5]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.forgtech-public-subnet-a.id
  vpc_security_group_ids = [aws_security_group.forgtech-bastion-sg.id]
  key_name = aws_key_pair.forgtech-key-pair.key_name  # Attach key pair here
  associate_public_ip_address = true
  tags = {
    Name  = "forgtech-bastion-host"
    Environment = var.environment[0]
    Owner  = var.environment[1]
  }
}
