resource "aws_iam_user" "iam-taha" {
  name = "Taha"
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}
resource "aws_iam_user" "iam-mostafa" {
  name = "Mostafa"
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# taha policy
data "aws_iam_policy_document" "taha-policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    resources = ["${aws_s3_bucket.forgtech-bucket.arn}/log/*"]
    effect = "Allow"
  }
}

# Convert json to arn so i can attach policy to taha
resource "aws_iam_policy" "json-arn-taha-policy" {
  name = "taha-policy"
  description = "taha s3 policy"
  policy = data.aws_iam_policy_document.taha-policy.json
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# attach policy to taha IAM User
resource "aws_iam_user_policy_attachment" "taha-user-policy" {
  user = aws_iam_user.iam-taha.name
  policy_arn = aws_iam_policy.json-arn-taha-policy.arn
}

# mostafa policy
data "aws_iam_policy_document" "mostafa-policy" {
  statement {
    actions = [
      "s3:PutObject"
    ]
    resources = ["${aws_s3_bucket.forgtech-bucket.arn}/*"]
    effect = "Allow"
  }
}
# Convert json to arn so i can attach policy to mostafa
resource "aws_iam_policy" "json-arn-mostafa-policy" {
  name = "mostafa-policy"
  description = "mostafa s3 policy"
  policy = data.aws_iam_policy_document.mostafa-policy.json
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# attach policy to mostafa IAM User
resource "aws_iam_user_policy_attachment" "mostafa-user-policy" {
  user = aws_iam_user.iam-mostafa.name
  policy_arn = aws_iam_policy.json-arn-mostafa-policy.arn
}

resource "aws_iam_access_key" "taha-access-key" {
  user = aws_iam_user.iam-taha.name
}
resource "aws_iam_access_key" "mostafa-access-key" {
  user = aws_iam_user.iam-mostafa.name
}
