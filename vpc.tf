resource "aws_vpc" "project-vpc" {
  cidr_block = var.vpc_cidr


  tags = {
    name = "kkrkkr"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = var.public-subnet-cidr
  availability_zone = var.availability_zone_public_subnet
}

resource "aws_subnet" "private_subnet_ec2" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = var.private_subnet_ec2_cidr
  availability_zone = var.availability_zone_private_subnet_ec2
}

resource "aws_subnet" "private_subnet_rds" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = var.private_subnet_rds_cidr
  availability_zone = var.availability_zone_private_subnet_rds
}

resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.project-vpc.id

  tags = {
    name = "project_igw"

  }
}

resource "aws_route_table" "project_public_subnet_route_table" {
  vpc_id = aws_vpc.project-vpc.id

  route  {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.project_igw.id
  }
    
  }

resource "aws_route_table_association" "project_public_subnet_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.project_public_subnet_route_table.id
  
}

resource "aws_eip" "project_eip" {
    domain = "vpc"
  }
resource "aws_nat_gateway" "project_nat_gateway" {
  allocation_id = aws_eip.project_eip.id
  subnet_id =aws_subnet.public_subnet.id
}

resource "aws_route_table" "project_private_subnet_ec2_route_table" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.project_nat_gateway.id
  }

  tags = {
   Name = "project_private_subnet_ec2_route_table"
  
  } 
} 

resource "aws_route_table_association" "project_private_subnet_ec2_association" {
  subnet_id      = aws_subnet.private_subnet_ec2.id
  route_table_id = aws_route_table.project_private_subnet_ec2_route_table.id
}


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
resource "aws_db_subnet_group" "project_db_subnet_group" {
    name = "kkrkkr"
    description = "DB subnet group for RDS instance"
    subnet_ids = [aws_subnet.private_subnet_ec2.id, aws_subnet.private_subnet_rds.id]
}