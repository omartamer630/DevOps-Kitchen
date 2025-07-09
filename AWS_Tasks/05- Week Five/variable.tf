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
