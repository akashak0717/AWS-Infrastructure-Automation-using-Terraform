resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"

  db_name              = "my_db"
  username             = var.db_username
  password             = var.db_password
  
  publicly_accessible  = true
  skip_final_snapshot  = true
  deletion_protection  = false

  storage_type = "gp2"

  backup_retention_period = 0
  multi_az = false
}