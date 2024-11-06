# Create Bucket 
resource "aws_s3_bucket" "Forgtech_bucket" {
  bucket = "forgtech-bucket"
  force_destroy = true
  tags = {
    Enviroment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}

# Enable Versioning in S3 Bucket
resource "aws_s3_bucket_versioning" "Forgtech_versioning_enabled" {
  bucket = aws_s3_bucket.Forgtech_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
# Make bucket only access by Owner
resource "aws_s3_bucket_ownership_controls" "only_owner_full_access" {
  bucket = aws_s3_bucket.Forgtech_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Give Permissions to IAM User Named Mohamed from iam.tf file
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.Forgtech_bucket.id

  policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.Forgtech_bucket.arn}/log/*",
            "Principal": {
              "AWS": "${aws_iam_user.iam_user_for_mohamed.arn}"
            }
        }
    ]
}
  )
}
