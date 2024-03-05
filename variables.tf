variable "terraform_region" {
    description = "region is for geographical area "
    type = string
  
}

variable "aws_region" {
    description = "the aws region where resources will be provisioned"
    default = "ap-south-1"
    type = string
}

variable "public-subnet-cidr" {
    description = "cidr block for public subnet"
    type = string
  
}
variable "vpc_cidr" {
    description = "cidr block for vpc"
    type = string
  
}
variable "private_subnet_ec2_cidr" {
    description = "cidr block for private subnet ec2"
    type = string  
}

variable "private_subnet_rds_cidr" {
    description = "cidr block for private subnet rds"
    type = string
}

variable "availability_zone_public_subnet" {
    description = "avilability zone for public subnet"
    type = string
  
}

variable "availability_zone_private_subnet_ec2" {
    description = "avilability zone for private subnet ec2"
    type = string
  
}

variable "availability_zone_private_subnet_rds" {
    description = "avilabiltiy zone for private subnet rds"
    type = string 

}
variable "ami_id" {
    description = "unique identifier of ami for ec2 instance"
    type = string 
}

variable "key_name" {
    description = "key name for ssh keypair"
    type = string
}
variable "instance_type" {
    description = "instance type for ec2 instance"
    type = string 
}
variable "engine" {
    description = "db engine for rds instance"
    type = string
}

variable "engine_version" {
    description = "specifies the db engine version for rds instance"
    type = string  
}
variable "instance_class" {
    description = "specifies the instance class forrds instance"
    type = string 
}

variable "user_name" {
    description = "username for rds"
    type = string
  
}

variable "password" {
    description = "password for rds"
  
}


