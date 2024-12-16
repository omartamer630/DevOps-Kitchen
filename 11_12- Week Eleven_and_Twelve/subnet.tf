resource "aws_subnet" "vpc_1_private_subnet" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = var.cidr[1].cidr
  availability_zone = var.AZs[0]
  tags = {
    Name = "${var.environment}-vpc-1-priv-subnet"
  }
}
resource "aws_subnet" "vpc_2_private_subnet" {
  vpc_id            = aws_vpc.vpc_2.id
  cidr_block        = var.cidr[3].cidr
  availability_zone = var.AZs[1]
  tags = {
    Name = "${var.environment}-vpc-2-priv-subnet"
  }
}

resource "aws_subnet" "vpc_3_public_subnet" {
  vpc_id            = aws_vpc.vpc_3.id
  cidr_block        = var.cidr[5].cidr
  availability_zone = var.AZs[2]
  tags = {
    Name = "${var.environment}-vpc-3-pub-subnet"
  }
}

resource "aws_route_table" "vpc_3_public_route_table" {
  vpc_id = aws_vpc.vpc_3.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_3_internet_gateway.id
  }
  tags = {
    Name = "${var.environment}-vpc-rtb-3"
  }
}

resource "aws_route_table_association" "name" {
  subnet_id      = aws_subnet.vpc_3_public_subnet.id
  route_table_id = aws_route_table.vpc_3_public_route_table.id
}

resource "aws_internet_gateway" "vpc_3_internet_gateway" {
  vpc_id = aws_vpc.vpc_3.id
  tags = {
    Name = "${var.environment}-vpc-igw-3"
  }
}
