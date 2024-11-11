resource "aws_instance" "forgtech-instance" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.forgtech-ec2-sg.id ]
  tags = {
    Name: "frogtech-instance"
    Environment: var.environment[0]
    Owner: var.environment[1]
  }
}
