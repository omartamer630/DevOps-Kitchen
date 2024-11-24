resource "aws_db_instance" "forgtech-rds-postgresql" {
  identifier                  = "forgtech-postgres-db"
  allocated_storage           = 20
  storage_encrypted           = true
  engine                      = "postgres"
  engine_version              = "15.4"
  instance_class              = "db.t3.micro"
  apply_immediately           = true
  publicly_accessible         = false # default is false
  multi_az                    =  true # using stand alone DB
  skip_final_snapshot         = true # after deleting RDS aws will not create snapshot 
  copy_tags_to_snapshot       = true # default = false
  db_subnet_group_name        = aws_db_subnet_group.db-attached-subnet.id
  vpc_security_group_ids      = [ aws_security_group.forgtech-rds-sg.id ]
  username                    = var.forgtech-senstive-data[0].username
  manage_master_user_password = true # manage password using secret manager service
  auto_minor_version_upgrade  = false # default = false
  allow_major_version_upgrade = true # default = true
  backup_retention_period     = 7 # default value is 7
  delete_automated_backups    = true # default = true
  blue_green_update {
    enabled = true # Blue Depolyment (Prod) , Green Deployment (Staging) 
  }
  tags = {
    Name = "forgtech-rds-posgress"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}

resource "aws_db_subnet_group" "db-attached-subnet" {
  name = "forgtech-db-subnet-group"
  subnet_ids = [
    "${aws_subnet.forgtech-private-subnet-a.id}",
    "${aws_subnet.forgtech-private-subnet-b.id}"
    ]
  tags = {
    Name = "rds-subnet-group"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}
