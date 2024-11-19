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
  type = list(string)
}
variable "cidr" {
  description = "CIDR Block that related to anything under forgtech-vpc"
  type = list(object({
    cidr-block = string
    name = string
  }))
}
variable "forgtech-senstive-data" {
  description = "Forgtech Senstive Data Vars"
  type = list(object({
    username = string
    password = string
  }))
  sensitive = true
}
