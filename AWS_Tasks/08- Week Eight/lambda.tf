# Create Lambda function with the code to transfer file from external to internal s3
resource "aws_lambda_function" "forgtech-file-transfer-function" {

  filename      = "lambda.zip"
  function_name = "s3-file-transfer-function"
  role          = aws_iam_role.lambda-s3-transfer-file-role.arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python3.9"

  environment {  # its Environment vars in the code
    variables = {
      SOURCE_BUCKET = aws_s3_bucket.forgtech-external-bucket.bucket # src that get object from external s3
      DEST_BUCKET = aws_s3_bucket.forgtech-internal-bucket.bucket #  dest that upload object to internal s3
    }
  }
  tags = {
    Enviroment = var.environment[0]
    Owner = var.environment[1]
  }
}
# allow lambda s3 bucket event to incoke my lambda function from s3 external bucket
resource "aws_lambda_permission" "allow-s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.forgtech-file-transfer-function.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.forgtech-external-bucket.arn
}

# set trigger or event when object is created it trigger lambda function 
resource "aws_s3_bucket_notification" "external_bucket_notification" {
  bucket = aws_s3_bucket.forgtech-external-bucket.id

  lambda_function {
    events = ["s3:ObjectCreated:*"]
    lambda_function_arn = aws_lambda_function.forgtech-file-transfer-function.arn
  }

  depends_on = [aws_lambda_permission.allow-s3]
}
