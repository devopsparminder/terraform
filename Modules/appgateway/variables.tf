variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "sku" {
  type = object({
    name     = string
    tier     = string
    capacity = number
  })

  default = null

}

variable "gateway_ip_configuration_name" {
  type = string
}

variable "frontend_port" { type = map(any) }
variable "frontend_ip_configuration" { type = map(any) }

variable "public_ip" {
  type = string
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "backend_address_pool_name" {
  type = string
}
variable "frontend_ip_configuration_name" {
  type = string
}

variable "http_setting_name" {

}
variable "frontend_port_name" {

}
variable "listener_name" {

}

variable "request_routing_rule" {

}
variable "subnet_id" {
  description = "Subnet for app gw"
}







