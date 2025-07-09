# [0] --> Enviroment [1] --> Owner
enviroment = [ "terraformChamps", "Omar"]

lifecycle-config = [ 
  {
  days = 30
  name = "STANDARD_IA"
  },
  {
  days = 90
  name = "GLACIER"
  },
  {
  days = 180
  name = "DEEP_ARCHIVE"
  },
  {
    days = 360
    name = "Remove_ALL"
  }
   ]
