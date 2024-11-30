# Create public subnet AZ a
resource "aws_subnet" "forgtech-public-subnet-a" {
  vpc_id                     = aws_vpc.forgtech-vpc.id
  count = var.preferred_number_of_public_subnets == null ? length(data.aws_availability_zones.available.names) : var.preferred_number_of_public_subnets
  cidr_block                 = cidrsubnet(var.cidr[0].cidr-block, 4, count.index)
  map_public_ip_on_launch    = true # making sure any ec2 put in this subnet will have IP address
  availability_zone          = data.aws_availability_zones.available.names[count.index]
}
