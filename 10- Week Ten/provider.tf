terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "DevOps-Kitchen"
    workspaces {
      name = "DevOps-workshop"
    }
  }
}

provider "aws" {
  region = var.AWS_DEFAULT_REGION
}
