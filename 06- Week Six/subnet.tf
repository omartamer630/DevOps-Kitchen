resource "aws_subnet" "forgtech-private-subnet-a" {
  vpc_id = aws_vpc.forgtech-vpc.id
  cidr_block = var.cidr[1].cidr-block
  availability_zone = var.environment[3]
  tags = {
    Name = var.cidr[1].name
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}
resource "aws_subnet" "forgtech-private-subnet-b" {
  vpc_id = aws_vpc.forgtech-vpc.id
  cidr_block = var.cidr[3].cidr-block
  availability_zone = var.environment[4]
  tags = {
    Name = var.cidr[3].name
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}

resource "aws_subnet" "forgtech-public-subnet-a" {
  vpc_id = aws_vpc.forgtech-vpc.id
  cidr_block = var.cidr[4].cidr-block
  availability_zone = var.environment[3]
  tags = {
    Name = var.cidr[4].name
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}
