provider "aws" {
  region = var.AWS_DEFAULT_REGION
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  } 

  # backend "s3" {
  #   bucket = "forgtech-terraform-statefile"
  #   key = "terraform.tfstate"
  #   region = "us-east-1"
  #   encrypt = true
  # }

  cloud {
    organization = "DevOps-Kitchen"
    workspaces {
      name = "DevOps-workshop"
    }
  }
}
