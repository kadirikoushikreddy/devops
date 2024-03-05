resource "aws_db_instance" "project_rds_instance" {
  allocated_storage    = 20
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.user_name
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.project_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  skip_final_snapshot = true
}
