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

resource "aws_internet_gateway" "forgtech-igw" {
  vpc_id = aws_vpc.forgtech-vpc.id
  tags = {
    Name = "forgtech-igw"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}

resource "aws_route_table" "forgtech-route-table" {
  vpc_id = aws_vpc.forgtech-vpc.id
  tags = {
    Name = "forgtech-rtb"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}
resource "aws_route_table_association" "forgtech-subnet-association" {
  subnet_id      = aws_subnet.forgtech-subnet.id
  route_table_id = aws_route_table.forgtech-route-table.id
}

resource "aws_route_table_association" "forgtech-subnetb-association" {
  subnet_id      = aws_subnet.forgtech-subnetb.id
  route_table_id = aws_route_table.forgtech-route-table.id
}
resource "aws_route" "forgtech-igw-route" {
  route_table_id         = aws_route_table.forgtech-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id            = aws_internet_gateway.forgtech-igw.id
}
