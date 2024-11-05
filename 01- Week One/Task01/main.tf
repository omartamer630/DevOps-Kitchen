provider "aws" {
  region = "us-east-1"
}
variable "cidr_blocks" {
  description = "CIDR block for VPC and Subnet"
  type = list(object({
    cidr_block = string
    name = string
  }))
}
variable "enviroment" {
  description = "Enviroment"
  type = list(string)
}
resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_blocks[0].cidr_block
  tags = {
    Name: "FrogTech-VPC"
    Environment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}
resource "aws_subnet" "pub-sub" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.cidr_blocks[1].cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name: "FrogTech-pub-sub"
    Environment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}
resource "aws_route_table" "pub-rtb" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name: "FrogTech-pub-rtb"
    Environment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}
resource "aws_route_table_association" "associate_sub_with_pub_rtb" {
  subnet_id = aws_subnet.pub-sub.id
  route_table_id = aws_route_table.pub-rtb.id
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name: "FrogTech-IGW"
    Environment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}


