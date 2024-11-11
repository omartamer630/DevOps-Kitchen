# [0] --> Enviroment [1] --> Owner [2] --> Region
environment = [ "terraformChamps", "Omar" , "us-east-1"]

cidr_blocks = [
{
  cidr_block = "10.0.0.0/16"
  name = "vpc-cidr"
},
{
  cidr_block = "10.0.1.0/24"
  name = "private-subnet-cidr"
},
{
    cidr_block = "156.218.13.212/32"
    name = "developer-ip"
}
 ]
