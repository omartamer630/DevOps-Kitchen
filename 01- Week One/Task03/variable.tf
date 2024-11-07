variable "enviroment" {
  description = "Enviroment"
  type = list(string)
}
variable "lifecycle-config" {
  description = "Life Cycle configuration"
  type = list(object({
    days = number
    name = string
  }))
}
