resource "aws_db_instance" "forgtech-rds-postgresql" {
  identifier = "forgtechpostgresdb"
  allocated_storage = 20
  engine = "postgres"
  engine_version = "15.4"
  instance_class = "db.t3.micro"
  publicly_accessible = true # for testing purpose
  skip_final_snapshot = true # after deleting RDS aws will not create snapshot
  multi_az =  false # using stand alone DB
  db_subnet_group_name = aws_db_subnet_group.db-attached-subnet.id
  vpc_security_group_ids = [ aws_security_group.forgtech-rds-sg.id ]
  availability_zone = var.environment[3]
  username = var.forgtech-senstive-data[0].username
  password = var.forgtech-senstive-data[0].password
  tags = {
    Name = "forgtech-rds-posgress"
    Environment = var.environment[0]
    Owner = var.environment[1]
  }
}
