resource "aws_security_group" "forgtech-rds-sg" {
  name = "rds-ingress-sg"
  description = "RDS inbound rules"
  vpc_id = aws_vpc.forgtech-vpc.id
  tags = {
    Name = "rds-sg"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}

# Allow the Bastion host security group to access RDS on port 5432 (PostgreSQL)
resource "aws_security_group_rule" "forgtech-rds-bastion-ingress" {
  type = "ingress"
  from_port = 5432
  to_port = 5432
  protocol = "tcp"
  security_group_id = aws_security_group.forgtech-rds-sg.id
  source_security_group_id = aws_security_group.forgtech-bastion-sg.id
}

resource "aws_vpc_security_group_egress_rule" "forgtech-rds-egress" {
  security_group_id = aws_security_group.forgtech-rds-sg.id
  ip_protocol = "-1"
  cidr_ipv4 = var.cidr[2].cidr-block
}

resource "aws_security_group" "forgtech-bastion-sg" {
  name = "basion-sg"
  description = "Bastion host rules"
  vpc_id = aws_vpc.forgtech-vpc.id
  tags = {
    Name = "basion-sg"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}

resource "aws_vpc_security_group_ingress_rule" "forgtech-bastion-ingress" {
  security_group_id = aws_security_group.forgtech-bastion-sg.id
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
  cidr_ipv4 = var.cidr[2].cidr-block # it should be specific ip for more security using 0.0.0.0/0 is insecure but
}
resource "aws_vpc_security_group_egress_rule" "forgtech-bastion-egress" {
  security_group_id = aws_security_group.forgtech-bastion-sg.id
  ip_protocol = "-1"
  cidr_ipv4 = var.cidr[2].cidr-block
}
