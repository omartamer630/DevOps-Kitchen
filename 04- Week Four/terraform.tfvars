# [0] --> Env [1] --> Owner [2] --> Region
environment = [ "terraformchamp","Omar", "us-east-1" ]

cidr-blocks = [ {
  cidr-block = "10.0.0.0/16"
  name = "forgtech-vpc"
}, {
  cidr-block = "10.0.1.0/24"
  name = "forgtech-subnet"
} ]
