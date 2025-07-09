# Creating IAM user Named Mohamed
resource "aws_iam_user" "iam_user_for_mohamed" {
  name = "Mohamed"
  tags = {
    Enviroment: var.enviroment[0]
    Owner: var.enviroment[1]
  }
}
