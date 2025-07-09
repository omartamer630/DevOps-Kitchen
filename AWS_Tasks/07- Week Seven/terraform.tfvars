# [0] --> Env [1] --> Owner [2] --> Region [3] --> Az [a] [4] --> AZ [b] [5] --> AMI
environment = [ "terraformChamp","Omar","us-east-1","us-east-1a","us-east-1b","ami-04a81a99f5ec58529"]

cidr = [ {
  cidr-block = "10.0.0.0/16"
  name = "forgtech-vpc"
}, {
  cidr-block = "10.0.1.0/24"
  name = "forgtech-private-subnet-a"
}, {
  cidr-block = "0.0.0.0/0"
  name = "all traffic"
}, {
  cidr-block = "10.0.2.0/24"
  name = "forgtech-private-subnet-b"
}, {
  cidr-block = "10.0.3.0/24"
  name = "forgtech-public-subnet-a"
}
 ]

forgtech-senstive-data = [ {
  username = "omartamer"
} ]
