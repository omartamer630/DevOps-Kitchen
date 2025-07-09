# create s3 bucket with destorying if not empty 
resource "aws_s3_bucket" "forgtech-bucket" {
  bucket = "forgtech-backup-bucket"
  force_destroy = true
  tags = {
    Enviroment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}

resource "aws_s3_object" "log-dir" {
  bucket = aws_s3_bucket.forgtech-bucket.id
  key = "log/"
  tags = {
    Enviroment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}
resource "aws_s3_object" "outgoing-dir" {
  bucket = aws_s3_bucket.forgtech-bucket.id
  key = "outgoing/"
  tags = {
    Enviroment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}
resource "aws_s3_object" "incoming-dir" {
  bucket = aws_s3_bucket.forgtech-bucket.id
  key = "incoming/"
  tags = {
    Enviroment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}
