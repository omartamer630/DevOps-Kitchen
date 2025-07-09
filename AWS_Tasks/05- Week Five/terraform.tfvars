# [0] --> Env [1] --> Owner [2] --> Region [3] --> Az [a] [4] --> AZ [b] 
environment = [ "terraformChamp","Omar","us-east-1","us-east-1a","us-east-1b"]
cidr = [ {
  cidr-block = "10.0.0.0/16"
  name = "forgtech-vpc"
}, {
  cidr-block = "10.0.1.0/24"
  name = "forgtech-subnet"
}, {
  cidr-block = "0.0.0.0/0"
  name = "all traffic"
}, {
  cidr-block = "10.0.2.0/24"
  name = "forgtech-subnetb"
}
 ]

forgtech-senstive-data = [ {
  username = "omartamer"
  password = "omartamer#525212"
} ]
