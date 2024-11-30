resource "aws_instance" "forgtech-ec2" {
  ami                    = "ami-0866a3c8686eaeeba"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.forgtech-public-subnet-a[0].id
  vpc_security_group_ids = [aws_security_group.forgtech-ec2-sg.id]
  key_name = aws_key_pair.forgtech-key-pair.key_name  # Attach key pair here
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.ec2-profile.arn
  tags = var.environment
}
