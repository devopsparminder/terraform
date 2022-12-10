variable "location_shortname" {
}
variable "location_fullname" {
}
variable "environment" {
  type = string
  validation {
    condition     = contains(["dev", "poc", "dev1", "dev2", "test", "stage", "prod"], var.environment)
    error_message = "The environment must be dev,dev1,dev2, test, stage or prod."
  }
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "location" {
  type        = string
  description = "(Required) Location short name"
}
variable "virtual_network_name" {
  description = "Virtual network name"
  default     = "vnet-aks"
}
variable "virtual_network_address_prefix" {
  description = "VNET address prefix"
  default     = ["10.0.0.0/16"]
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
