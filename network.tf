resource "aws_ec2_instance_connect_endpoint" "web-development" {
  subnet_id = aws_subnet.private_subnet_ec2.id

  tags = {
    Name = "key"
  }
  
}

resource "aws_db_subnet_group" "project_db_subnet_group" {
    name = "kkrkkr"
    description = "DB subnet group for RDS instance"
    subnet_ids = [aws_subnet.private_subnet_ec2.id, aws_subnet.private_subnet_rds.id]
}
