resource "aws_lambda_function" "lambda-efs-mount" {
  filename      = "lambda.zip"
  function_name = "efs-mount-function"
  role          = aws_iam_role.lambda-role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  tags          = var.environment

  file_system_config {
    arn              = aws_efs_access_point.access_point_for_lambda.arn
    local_mount_path = "/mnt/efs"
  }
  vpc_config {
    # Every subnet should be able to reach an EFS mount target in the same Availability Zone. Cross-AZ mounts are not permitted.
    subnet_ids         = [aws_subnet.forgtech-public-subnet[0].id]
    security_group_ids = [aws_security_group.forgtech-ec2-sg.id]
  }

  depends_on = [aws_efs_mount_target.efs-ec2-target]

}

resource "aws_lambda_function_url" "lamba-efs-url" {
  function_name      = aws_lambda_function.lambda-efs-mount.function_name
  authorization_type = "NONE"
}
