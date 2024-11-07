# S3 Policies that can do Backup and restore via itself
resource "aws_s3_bucket_policy" "allow-s3-to-backup-policy" {
  bucket = aws_s3_bucket.forgtech-bucket.id

  policy = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::022499038054:user/windowsUser"
      },
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "${aws_s3_bucket.forgtech-bucket.arn}",
        "${aws_s3_bucket.forgtech-bucket.arn}/log/*",
        "${aws_s3_bucket.forgtech-bucket.arn}/outgoing/*",
        "${aws_s3_bucket.forgtech-bucket.arn}/incoming/*"
      ]
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::022499038054:user/windowsUser"
      },
      "Action": [
        "s3:RestoreObject"
      ],
      "Resource": [
        "${aws_s3_bucket.forgtech-bucket.arn}/log/*",
        "${aws_s3_bucket.forgtech-bucket.arn}/outgoing/*",
        "${aws_s3_bucket.forgtech-bucket.arn}/incoming/*"
      ]
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::022499038054:user/windowsUser"
      },
      "Action": [
        "s3:PutObjectTagging",
        "s3:GetObjectTagging",
        "s3:DeleteObjectTagging"
      ],
      "Resource": "${aws_s3_bucket.forgtech-bucket.arn}/outgoing/*"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::022499038054:user/windowsUser"
      },
      "Action": [
        "s3:AbortMultipartUpload"
      ],
      "Resource": "${aws_s3_bucket.forgtech-bucket.arn}/log/*"
    }
  ]
}

  )
}
