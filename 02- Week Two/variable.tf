variable "environment" {
  description = "environment for all services"
  type = list(string)
}
variable "cidr_blocks" {
  description = "CIDR block for VPC and Private Subnet"
  type = list(object({
    cidr_block = string
    name = string
  }))
}
