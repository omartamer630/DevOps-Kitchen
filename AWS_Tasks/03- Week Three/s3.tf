resource "aws_s3_bucket" "forgtech-bucket" {
  bucket = "forgtech-bucket"
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

resource "aws_s3_bucket_versioning" "forgtech-bucket-enable-versioning" {
  bucket = aws_s3_bucket.forgtech-bucket.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_object" "log-dir" {
  bucket = aws_s3_bucket.forgtech-bucket.id
  key = "log/"
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "forgtech-bucket-encryption" {
  bucket = aws_s3_bucket.forgtech-bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}
