# Create External Bucket 
resource "aws_s3_bucket" "forgtech-external-bucket" {
  bucket = "frogtech-us-external"
  force_destroy = true
  
  tags = {
    Enviroment = var.environment[0]
    Owner = var.environment[1]
  }
}

# Create Internal Bucket 
resource "aws_s3_bucket" "forgtech-internal-bucket" {
  bucket = "frogtech-us-internal"
  force_destroy = true
  tags = {
    Enviroment = var.environment[0]
    Owner = var.environment[1]
  }
}
