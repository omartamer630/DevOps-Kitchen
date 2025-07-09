# ============================== @Lambda Role@ ==============================
data "aws_iam_policy_document" "lambda-assume-role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]

    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "lambda-role" {
  name = "lambda-role"

  assume_role_policy = data.aws_iam_policy_document.lambda-assume-role.json
  tags               = var.environment
}

resource "aws_iam_role_policy_attachment" "lambda-ssm-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  role       = aws_iam_role.lambda-role.name
}

resource "aws_iam_role_policy_attachment" "lambda-ec2-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.lambda-role.name
}
# ============================== @Lambda Role End@ ==========================


# ============================== @EC2 Role@ ==============================

data "aws_iam_policy_document" "ec2-assume-role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com", "ssm.amazonaws.com"]

    }
    effect = "Allow"
  }
}
resource "aws_iam_role" "ec2-role" {
  name = "ec2-role"

  assume_role_policy = data.aws_iam_policy_document.ec2-assume-role.json
  tags               = var.environment
}

resource "aws_iam_role_policy_attachment" "ssm-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.ec2-role.name
}

# ============================== @EC2 Role End@ ==========================
