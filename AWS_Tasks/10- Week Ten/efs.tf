resource "aws_efs_file_system" "forgtech_efs_storage_ec2" {
  tags = var.environment
}

# Mount target connects the file system to the subnet
resource "aws_efs_mount_target" "efs-ec2-target" {
  file_system_id  = aws_efs_file_system.forgtech_efs_storage_ec2.id
  subnet_id       = aws_subnet.forgtech-public-subnet[0].id
  security_groups = [aws_security_group.forgtech-ec2-sg.id]
}

# EFS access point used by lambda file system
resource "aws_efs_access_point" "access_point_for_lambda" {
  file_system_id = aws_efs_file_system.forgtech_efs_storage_ec2.id

  root_directory {
    path = "/lambda"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "750" # limit access to only lambda
    }
  }

  posix_user {
    gid = 1000
    uid = 1000
  }
}
