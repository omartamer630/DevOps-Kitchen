resource "aws_lambda_function" "lambda-activate-ssm-doc" {
  filename      = "lambda.zip"
  function_name = "ssm-activate-function"
  role          = aws_iam_role.lambda-role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"

  environment { # its Environment vars in the code
    variables = {
      EC2_INSTANCE_ID = aws_instance.forgtech-ec2.id # EC2 ID
    }
  }
  tags = var.environment
}
