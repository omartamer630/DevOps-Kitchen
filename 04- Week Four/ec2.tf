# Create EC2
resource "aws_instance" "forgtech-webserver-ec2" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.forgtech-subnet.id
  iam_instance_profile = aws_iam_instance_profile.forgtech-ec2-instance-profile.name # Attach IAM Role
  key_name = aws_key_pair.forgtech_key_pair.key_name  # Attach key pair here
  associate_public_ip_address = true  # Automatically assign public IP
  tags = {
    Name: "The web application server"
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}
