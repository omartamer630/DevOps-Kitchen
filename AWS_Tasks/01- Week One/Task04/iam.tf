# Create Internal user
resource "aws_iam_user" "init_user_ahmed" {
  name = "Ahmed"
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}
# Create External user
resource "aws_iam_user" "init_user_mahmoud" {
  name = "Mahmoud"
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}
# Create Internal user
resource "aws_iam_user" "init_user_mostafa" {
  name = "Mostafa"
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# ahmed policy
data "aws_iam_policy_document" "ahmed_internal_policy" {
  statement {
    actions = [
      "s3:*",
      "s3-object-lambda:*"
    ]
    resources = ["*"]
    effect = "Allow"
  }
}
# Convert json to arn so i can attach policy to ahmed
resource "aws_iam_policy" "json-arn-ahmed-policy" {
  name = "ahmed-policy"
  description = "ahmed internal s3 policy"
  policy = data.aws_iam_policy_document.ahmed_internal_policy.json
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# attach policy to ahmed IAM User
resource "aws_iam_user_policy_attachment" "ahmed_user_policy" {
  user = aws_iam_user.init_user_ahmed.name
  policy_arn = aws_iam_policy.json-arn-ahmed-policy.arn
}

# mahmoud policy
data "aws_iam_policy_document" "mahmoud_external_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    resources = ["${aws_s3_bucket.forgtech-bucket.arn}"]
    effect = "Allow"
    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values   = ["${var.environment[2]}"]
    }
  }
}
# Convert json to arn so i can attach policy to ahmed
resource "aws_iam_policy" "json-arn-mahmoud-policy" {
  name = "mahmoud-policy"
  description = "mahmoud external s3 policy"
  policy = data.aws_iam_policy_document.mahmoud_external_policy.json
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# attach policy to mahmoud IAM User
resource "aws_iam_user_policy_attachment" "mahmoud_user_policy" {
  user = aws_iam_user.init_user_mahmoud.name
  policy_arn = aws_iam_policy.json-arn-mahmoud-policy.arn
}

# mostafa policy
data "aws_iam_policy_document" "mostafa_internal_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    resources = ["${aws_s3_bucket.forgtech-bucket.arn}"]
    effect = "Allow"
  }
}
# Convert json to arn so i can attach policy to ahmed
resource "aws_iam_policy" "json-arn-mostafa-policy" {
  name = "mostafa-policy"
  description = "mostafa internal s3 policy"
  policy = data.aws_iam_policy_document.mostafa_internal_policy.json
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# attach policy to mostafa IAM User
resource "aws_iam_user_policy_attachment" "mostafa_user_policy" {
  user = aws_iam_user.init_user_mostafa.name
  policy_arn = aws_iam_policy.json-arn-mostafa-policy.arn
}
