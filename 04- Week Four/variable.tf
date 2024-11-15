variable "environment" {
  description = "All files shared Env"
  type = list(string)
}
variable "cidr-blocks" {
  description = "Contains Cidr of entire vpc"
  type = list(object({
    cidr-block = string
    name = string 
  }))
}
