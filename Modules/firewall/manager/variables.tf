variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "fw_name" {
  type        = string
  description = "Specifies the name of Firewall"
}

variable "firewall_policy_id" {
  
}

variable "tags" {
  type    = map(string)
  default = {}
}
variable "fw_public_ip_name" {
  type        = string
  description = "The name of public IP"
}

variable "fw_subnet_id" {
  type        = string
  description = "The subnet ID in which to create Firewall"
}

variable "sku_tier" {
  type        = string
  default     = "Standard"
  description = "Sku tier of the Firewall. Possible values are Premium and Standard. Changing this forces a new resource to be created"
}
