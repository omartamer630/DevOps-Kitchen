resource "aws_security_group" "forgtech-vpc-endpoint-sg" {
  vpc_id = aws_vpc.forgtech-vpc-backup.id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  tags = {
    Name: "frogtech-vpc-endpoint-sg"
    Environment: var.environment[0]
    Owner: var.environment[1]
  } 
}

resource "aws_security_group_rule" "forgtech_vpc_endpoint_ingress" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.forgtech-vpc-endpoint-sg.id
  source_security_group_id = aws_security_group.forgtech-ec2-sg.id
}

resource "aws_security_group" "forgtech-ec2-sg" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks[2].cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name: "frogtech-ec2-sg"
    Environment: var.environment[0]
    Owner: var.environment[1]
  }  
}



