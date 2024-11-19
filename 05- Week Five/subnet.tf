resource "aws_subnet" "forgtech-subnet" {
  vpc_id = aws_vpc.forgtech-vpc.id
  cidr_block = var.cidr[1].cidr-block
  availability_zone = var.environment[3]
  tags = {
    Name = var.cidr[1].name
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}
resource "aws_subnet" "forgtech-subnetb" {
  vpc_id = aws_vpc.forgtech-vpc.id
  cidr_block = var.cidr[3].cidr-block
  availability_zone = var.environment[4]
  tags = {
    Name = var.cidr[3].name
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}
resource "aws_db_subnet_group" "db-attached-subnet" {
  name = "forgtech-db-subnet-group"
  subnet_ids = [
    "${aws_subnet.forgtech-subnet.id}",
    "${aws_subnet.forgtech-subnetb.id}"
    ]
  tags = {
    Name = "rds-subnet-group"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}
