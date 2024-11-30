resource "aws_ssm_document" "ssm-ssh-restart-doc" {
  name          = "RestartSSHService"
  document_type = "Command"
  content = file("${path.module}/RestartSSHService.json")
}
