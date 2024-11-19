# Create an S3 bucket for storing the key
resource "aws_s3_bucket" "forgtech_key_bucket" {
  bucket = "forgtech-keys-bucket"
  tags = {
    Name        = "Forgtech Keys Bucket"
    Environment = var.environment[0]
    Owner       = var.environment[1]
  }
}

# Upload the private key to S3
resource "aws_s3_object" "forgtech_key_object" {
  bucket = aws_s3_bucket.forgtech_key_bucket.id
  key    = "keys/forgtech-key.pem"
  content = tls_private_key.forgtech_key.private_key_pem

  tags = {
    Name        = "Forgtech Key File"
    Environment = var.environment[0]
    Owner       = var.environment[1]
  }
}
