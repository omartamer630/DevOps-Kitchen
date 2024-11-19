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

resource "aws_vpc_security_group_ingress_rule" "forgtech-rds-ingress" {
  security_group_id = aws_security_group.forgtech-rds-sg.id
  from_port = 5432
  ip_protocol = "tcp"
  to_port = 5432
  cidr_ipv4 = var.cidr[2].cidr-block # it should be specific ip for more security using 0.0.0.0/0 is insecure but
}
resource "aws_vpc_security_group_egress_rule" "forgtech-rds-egress" {
  security_group_id = aws_security_group.forgtech-rds-sg.id
  ip_protocol = "-1"
  cidr_ipv4 = var.cidr[2].cidr-block
}
