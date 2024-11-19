resource "aws_db_instance" "forgtech-rds-postgresql" {
  identifier = "forgtechpostgresdb"
  allocated_storage = 20
  engine = "postgres"
  engine_version = "15.4"
  instance_class = "db.t3.micro"
  skip_final_snapshot = true # after deleting RDS aws will not create snapshot
  multi_az =  true # using stand alone DB
  db_subnet_group_name = aws_db_subnet_group.db-attached-subnet.id
  vpc_security_group_ids = [ aws_security_group.forgtech-rds-sg.id ]
  username = var.forgtech-senstive-data[0].username
  manage_master_user_password = true
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
