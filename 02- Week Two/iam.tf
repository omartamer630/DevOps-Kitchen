resource "aws_iam_user" "forgtech-developer-iam" {
  name = "developer"
}

# developer ec2 policy
data "aws_iam_policy_document" "developer_policy" {
  statement {
    actions = [
      "ec2:*",
      "s3:PutObject"
    ]
    resources = ["*"]
    effect = "Allow"
  }
}
# Convert json to arn so i can attach policy to developer
resource "aws_iam_policy" "json-arn-developer-policy" {
  name = "developer-policy"
  description = "developer ec2 policy"
  policy = data.aws_iam_policy_document.developer_policy.json
  tags = {
    Enviroment: var.environment[0]
    Owner: var.environment[1]
  }
}

# attach policy to developer IAM User
resource "aws_iam_user_policy_attachment" "developer_attach_policy" {
  user = aws_iam_user.forgtech-developer-iam.name
  policy_arn = aws_iam_policy.json-arn-developer-policy.arn
}
