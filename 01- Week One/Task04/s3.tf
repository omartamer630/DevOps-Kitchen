# create s3 bucket
resource "aws_s3_bucket" "forgtech-bucket" {
  bucket = "forgtech-bucket"
  force_destroy = true
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  } 
}
