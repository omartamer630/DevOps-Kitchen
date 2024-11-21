resource "aws_vpc" "forgtech-vpc" {
  cidr_block = var.cidr[0].cidr-block
  enable_dns_support   = true  # Enable DNS resolution for reslove hostname to ip and achieve communication between service
  enable_dns_hostnames = true  # Enable DNS hostnames for add hostname to every service in vpc
  tags = {
    Name = var.cidr[0].name
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}

resource "aws_route_table" "forgtech-public-route-table" {
  vpc_id = aws_vpc.forgtech-vpc.id
  tags = {
    Name = "forgtech-public-rtb"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}

resource "aws_internet_gateway" "forgtech-igw" {
  vpc_id = aws_vpc.forgtech-vpc.id
  tags = {
    Name = "forgtech-igw"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}

resource "aws_route" "forgtech-igw-route" {
  route_table_id         = aws_route_table.forgtech-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id            = aws_internet_gateway.forgtech-igw.id
}

resource "aws_route_table_association" "forgtech-public-subnet-a-association" {
  subnet_id      = aws_subnet.forgtech-public-subnet-a.id
  route_table_id = aws_route_table.forgtech-public-route-table.id
}
