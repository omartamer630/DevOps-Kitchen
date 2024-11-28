# allow lambda to use this IAM Role
data "aws_iam_policy_document" "lambda-assume-policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
      
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "lambda-s3-transfer-file-role" {
  name = "lambda-role"

  assume_role_policy = data.aws_iam_policy_document.lambda-assume-policy.json
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# Make Inline Policy to allow lambda that can Get and Upload Object Through S3 bucket
data "aws_iam_policy_document" "lambda-policy-to-access-s3" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [ 
      "${aws_s3_bucket.forgtech-external-bucket.arn}/*", 
      "${aws_s3_bucket.forgtech-internal-bucket.arn}/*"
      ]
    effect = "Allow"
  }
}

# Convert json to arn so i can attach policy to lambda role
resource "aws_iam_policy" "json-arn-lambda-policy" {
  name = "lambda-policy"
  description = "lambda s3 policy"
  policy = data.aws_iam_policy_document.lambda-policy-to-access-s3.json
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# attach policy to lambda IAM role
resource "aws_iam_role_policy_attachment" "lambda-role-policy" {
  role = aws_iam_role.lambda-s3-transfer-file-role.name
  policy_arn = aws_iam_policy.json-arn-lambda-policy.arn
}
