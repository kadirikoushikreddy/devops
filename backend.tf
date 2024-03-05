terraform {
  backend "s3" {
    bucket = "project-demo789"
    key = "terraform.tfstate"
    region = "ap-south-1"
 }
}
