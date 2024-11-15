resource "aws_vpc" "forgtech-vpc" {
  cidr_block = var.cidr-blocks[0].cidr-block
  tags = {
    Name: var.cidr-blocks[0].name
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}
resource "aws_subnet" "forgtech-subnet" {
  vpc_id = aws_vpc.forgtech-vpc.id
  cidr_block = var.cidr-blocks[1].cidr-block
  availability_zone = "us-east-1a"
  tags = {
    Name: var.cidr-blocks[1].name
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}
resource "aws_route_table" "pub-rtb" {
  vpc_id = aws_vpc.forgtech-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name: "FrogTech-pub-rtb"
    Environment: var.environment[0]
    Owner: var.environment[1]
  }
}
resource "aws_route_table_association" "associate_sub_with_pub_rtb" {
  subnet_id = aws_subnet.forgtech-subnet.id
  route_table_id = aws_route_table.pub-rtb.id
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.forgtech-vpc.id
  tags = {
    Name: "FrogTech-IGW"
    Environment: var.environment[0]
    Owner: var.environment[1]
  }
}
resource "aws_vpc_endpoint" "forgtech-endpoint" {
  vpc_id = aws_vpc.forgtech-vpc.id
  service_name = "com.amazonaws.${var.environment[2]}.s3"
  tags = {
    Name: var.cidr-blocks[0].name
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}
