#Create IAM Role to EC2
resource "aws_iam_role" "forgtech-ec2-role" {
  name = "webserver-ec2-role"
  assume_role_policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }
  ]
})
  tags = {
    Environment = var.environment[0]
    Owner       = var.environment[1]
  }
}
# Attach S3Fullaccess to ec2 role
resource "aws_iam_role_policy_attachment" "forgtech-ec2-s3-policy-attachment" {
  role       = aws_iam_role.forgtech-ec2-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Add instance profile to role so i can attach it to ec2 instance
resource "aws_iam_instance_profile" "forgtech-ec2-instance-profile" {
    name = "forgtech-ec2-instance-profile"
  role = aws_iam_role.forgtech-ec2-role.name
}
