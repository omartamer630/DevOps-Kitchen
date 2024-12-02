resource "aws_vpc" "forgtech-vpc" {
  cidr_block           = var.cidr[0].cidr-block
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags                 = var.environment
}

resource "aws_internet_gateway" "forgtec-igw" {
  vpc_id = aws_vpc.forgtech-vpc.id

  tags = var.environment
}

resource "aws_route_table" "forgtech-public-rtb" {
  vpc_id = aws_vpc.forgtech-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.forgtec-igw.id
  }

  tags = var.environment
}
resource "aws_route_table_association" "associate_sub_with_pub_rtb" {
  subnet_id      = aws_subnet.forgtech-public-subnet[0].id
  route_table_id = aws_route_table.forgtech-public-rtb.id
}
