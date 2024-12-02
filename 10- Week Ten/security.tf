resource "aws_security_group" "forgtech-ec2-sg" {
  name        = "ec2-sg"
  description = "ec2 rules"
  vpc_id      = aws_vpc.forgtech-vpc.id
  tags        = var.environment
}

resource "aws_vpc_security_group_ingress_rule" "forgtech-ec2-ingress" {
  security_group_id = aws_security_group.forgtech-ec2-sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}


# Inbound rule for EFS allowing traffic from EC2 instances
resource "aws_vpc_security_group_ingress_rule" "efs-ingress" {
  security_group_id = aws_security_group.forgtech-ec2-sg.id
  from_port         = 2049
  to_port           = 2049
  ip_protocol       = "tcp"
  cidr_ipv4         = aws_vpc.forgtech-vpc.cidr_block

}

resource "aws_vpc_security_group_egress_rule" "efs-egress" {
  security_group_id = aws_security_group.forgtech-ec2-sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

