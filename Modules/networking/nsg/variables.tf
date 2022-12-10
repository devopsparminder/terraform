variable "resource_group_name" {
  default     = "rg"
  description = "Name of the resource group."
}

variable "location" {
  default     = "westus"
  description = "Location of the resource group."
}
variable "nsg_names" {
  type    = list(string)
  default = ["nsg-1", "nsg-2"]
}
variable "subnet_id" {
  
  description = "Subnet Id"
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet1", "subnet2", "subnet3"]
}