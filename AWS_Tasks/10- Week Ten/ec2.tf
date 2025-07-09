resource "aws_instance" "forgtech-ec2" {
  ami                         = "ami-0866a3c8686eaeeba" # Ubuntu AMI
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.forgtech-public-subnet[0].id
  vpc_security_group_ids      = [aws_security_group.forgtech-ec2-sg.id]
  key_name                    = "forgtech-keypair" # Attach key pair here
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2-profile.name
  tags                        = var.environment
  user_data                   = <<-EOF
              #!/bin/bash
              sudo apt-get update && sudo apt-get install -y nfs-common
              sudo mkdir /mnt/efs
              sudo mount -t nfs4 -o nfsvers=4.1 ${aws_efs_file_system.forgtech_efs_storage_ec2.id}:/ /mnt/efs
    EOF
  depends_on = [ aws_efs_access_point.access_point_for_lambda ]
}
