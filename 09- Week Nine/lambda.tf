resource "aws_lambda_function" "lambda-activate-ssm-doc" {
  filename      = "lambda.zip"
  function_name = "ssm-activate-function"
  role          = aws_iam_role.lambda-role.arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python3.9"

  environment {  # its Environment vars in the code
    variables = {
      INSTANCE_ID = aws_instance.forgtech-ec2.id # EC2 ID
      SSM_DOCUMENT_NAME = aws_ssm_document.ssm-ssh-restart-doc.name # SSM Doc Name
    }
  }
  tags = var.environment
}

resource "aws_lambda_permission" "allow-cloudwatch-invoke-lambda" {
  statement_id  = "AllowCloudWatchInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda-activate-ssm-doc.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.event-lambda-trigger.arn
}
