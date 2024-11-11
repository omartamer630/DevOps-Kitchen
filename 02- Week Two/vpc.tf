resource "aws_vpc" "forgtech-vpc-backup" {
  cidr_block = var.cidr_blocks[0].cidr_block
  enable_dns_hostnames = true 
  enable_dns_support = true #Enable Resolution & hostname for vpc endpoint 
  tags = {
    Name: "frogtech-VPC"
    Environment: var.environment[0]
    Owner: var.environment[1]
  }
}
resource "aws_subnet" "forgtech-private-subnet" {
  vpc_id = aws_vpc.forgtech-vpc-backup.id
  cidr_block = var.cidr_blocks[1].cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name: "frogtech-private-subnet"
    Environment: var.environment[0]
    Owner: var.environment[1]
  } 
}

resource "aws_route_table" "forgtech-private-rtb" {
  vpc_id = aws_vpc.forgtech-vpc-backup.id
  route {
    cidr_block = "local"
    vpc_endpoint_id = aws_vpc_endpoint.forgtech-vpc-endpoint.id
  }
  tags = {
    Name: "frogtech-private-rtb"
    Environment: var.environment[0]
    Owner: var.environment[1]
  } 
}

resource "aws_route_table_association" "forgtech-private-subnet-rtb" {
  subnet_id      = aws_subnet.forgtech-private-subnet.id
  route_table_id = aws_route_table.forgtech-private-rtb.id
}

resource "aws_vpc_endpoint" "forgtech-vpc-endpoint" {
  vpc_id = aws_vpc.forgtech-vpc-backup.id
  route_table_ids = aws_route_table.forgtech-private-rtb.id
  service_name = "com.amazonaws.${var.environment[2]}.s3"
  private_dns_enabled = true
  tags = {
    Name: "frogtech-vpc-endpoint"
    Environment: var.environment[0]
    Owner: var.environment[1]
  } 
}

