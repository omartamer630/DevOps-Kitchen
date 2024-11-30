resource "aws_cloudwatch_event_rule" "event-lambda-trigger" {
  name                = "event-lambda-trigger"
  description         = "Trigger Lambda Function every 3 minuts"
  schedule_expression = "rate(3 minutes)"
}

resource "aws_cloudwatch_event_target" "name" {
  rule = aws_cloudwatch_event_rule.event-lambda-trigger.name
  arn  = aws_lambda_function.lambda-activate-ssm-doc.arn
}
