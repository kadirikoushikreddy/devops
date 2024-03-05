provider "aws" {
  region = var.aws_region
 }
resource "aws_instance" "project-demo" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
    subnet_id = aws_subnet.private_subnet_ec2.id
   
 }
