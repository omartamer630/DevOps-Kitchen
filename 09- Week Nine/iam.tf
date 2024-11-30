# ============================== @Lambda Role@ ==============================
data "aws_iam_policy_document" "lambda-assume-role" {
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

resource "aws_iam_role" "lambda-role" {
  name = "lambda-role"

  assume_role_policy = data.aws_iam_policy_document.lambda-assume-role.json
  tags = var.environment
}

data "aws_iam_policy_document" "lambda-ssm-and-cloudwatch-polices" {
  statement {
    actions = [
        "ssm:SendCommand",
        "ssm:ListCommands",
        "ssm:ListCommandInvocations"
    ]
    resources = [ 
        aws_ssm_document.ssm-ssh-restart-doc.arn,
        aws_instance.forgtech-ec2.arn
     ]

    effect = "Allow"
  }
}

# Convert json to arn so i can attach policy to lambda role
resource "aws_iam_policy" "lambda-ssm-policy-to-json" {
  name = "lambda-ssm-policy-to-json"
  description = " Convert Data to Json So terraform can correct the policy"
  policy = data.aws_iam_policy_document.lambda-ssm-and-cloudwatch-polices.json
  tags = var.environment
}

# attach policy to role
resource "aws_iam_role_policy_attachment" "attach-lambda-policy" {
  role = aws_iam_role.lambda-role.name
  policy_arn = aws_iam_policy.lambda-ssm-policy-to-json.arn
}

# ============================== @Lambda Role End@ ==========================


# ============================== @EC2 Role@ ==============================

data "aws_iam_policy_document" "ec2-assume-role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
      
    }
    effect = "Allow"
  }
}
resource "aws_iam_role" "ec2-role" {
  name = "ec2-role"

  assume_role_policy = data.aws_iam_policy_document.ec2-assume-role.json
  tags = var.environment
}

data "aws_iam_policy_document" "ec2-and-ssm-polices" {
  statement {
    actions = [
        "ssm:UpdateInstanceInformation",
        "ssm:ListInstanceAssociations",
        "ssm:DescribeInstanceProperties",
        "ssm:DescribeDocument",
        "ssm:SendCommand",
        "ssm:ListDocuments",
        "ssm:GetCommandInvocation"
    ]
    resources = [ 
        aws_ssm_document.ssm-ssh-restart-doc.arn,
        aws_instance.forgtech-ec2.arn
     ]

    effect = "Allow"
  }
  statement {
    actions = [
        "ec2messages:GetMessages",
        "ec2messages:AcknowledgeMessage",
        "ec2messages:SendReply"
    ]
    resources = [ 
        aws_ssm_document.ssm-ssh-restart-doc.arn,
        aws_instance.forgtech-ec2.arn
     ]

     
    effect = "Allow"
  }
  statement {
    actions = [
        "ssmmessages:CreateControlChannel",
        "ssmmessages:CreateDataChannel",
        "ssmmessages:OpenControlChannel",
        "ssmmessages:OpenDataChannel"
    ]
    resources = [ 
        aws_ssm_document.ssm-ssh-restart-doc.arn,
        aws_instance.forgtech-ec2.arn
     ]

    effect = "Allow"
  }
}

# Convert json to arn so i can attach policy to ec2 role
resource "aws_iam_policy" "ec2-and-ssm-policy-to-json" {
  name = "ec2-and-ssm-policy-to-json"
  description = " Convert Data to Json So terraform can correct the policy"
  policy = data.aws_iam_policy_document.ec2-and-ssm-polices.json
  tags = var.environment
}

resource "aws_iam_role_policy_attachment" "attach-ec2-policy" {
  role = aws_iam_role.ec2-role.name
  policy_arn = aws_iam_policy.ec2-and-ssm-policy-to-json.arn
}

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "ec2-profile"
  role = aws_iam_role.ec2-role.name
}
# ============================== @EC2 Role End@ ==========================
