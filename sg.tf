resource "aws_security_group" "ec2_security_group" {
  vpc_id = aws_vpc.project-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
    
  tags = {
    Name = "kkrkkr"
  }
}



resource "aws_security_group" "rds_security_group" {
    vpc_id = aws_vpc.project-vpc.id

 ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"

  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
    
  tags = {
    Name = "king"
  }
}
