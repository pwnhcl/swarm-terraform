variable "app_ports" {
  type    = list(number)
  default = [22, 8080, 3000]
}

variable "ami" {
  default = "ami-019715e0d74f695be"
}