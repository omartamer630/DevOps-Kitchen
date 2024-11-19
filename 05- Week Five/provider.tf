provider "aws" {
  region = var.environment[2]
}
terraform {
  backend "s3" {
    bucket = "forgtech-terraform-statefile"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
