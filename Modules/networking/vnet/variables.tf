variable "resource_group_name" {
  default     = "rg"
  description = "Name of the resource group."
}

variable "location" {
  default     = "westus"
  description = "Location of the resource group."
}

variable "virtual_network_name" {
  description = "Virtual network name"
  default     = "vnet-aks"
}
variable "virtual_network_address_prefix" {
  description = "VNET address prefix"
  default     = ["10.0.0.0/16"]
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet1", "subnet2", "subnet3"]
}
