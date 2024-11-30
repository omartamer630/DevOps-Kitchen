variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS Access Key ID"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS Secret Access Key"
  sensitive   = true
}

variable "AWS_DEFAULT_REGION" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "environment" {
  description = "Most Used Variables in All services"
  default = {
  Environment = "terraformChamp"
  Owner = "Omar"
  Name = "forgtech"
  }
}

variable "cidr" {
  description = "CIDR Block that related to anything under forgtech-vpc"
  type = list(object({
    cidr-block = string
    name       = string
  }))
}

variable "preferred_number_of_public_subnets" {
  default = null
}

data "aws_availability_zones" "available" {
  state = "available"
}
