cidr_blocks = [
{
  cidr_block = "10.0.0.0/16"
  name = "vpc_cidr"
},
{
  cidr_block = "10.0.1.0/24"
  name = "subnet_cidr"
} ]
# [0] --> Enviroment [1] --> Owner [2] --> Task Name
enviroment = [ "terraformChamps", "Omar" , "Task01" ]
