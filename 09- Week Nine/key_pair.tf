resource "aws_key_pair" "forgtech-key-pair" {
  key_name   = "forgtech-key"
  public_key = file("${path.module}/keys/id_rsa.pub")
}
