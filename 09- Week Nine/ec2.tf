resource "aws_instance" "forgtech-ec2" {
  ami                    = "ami-0a3c3a20c09d6f377"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.forgtech-public-subnet-a[0].id
  vpc_security_group_ids = [aws_security_group.forgtech-ec2-sg.id]
  key_name = aws_key_pair.forgtech-key-pair.key_name  # Attach key pair here
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
  tags = var.environment
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
              sudo systemctl start amazon-ssm-agent
    EOF
}
