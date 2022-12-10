variable "resource_group_name" {
  default     = "rg"
  description = "Name of the resource group."
}

variable "location" {
  description = "Location of the resource group."
}
variable "storage_name" {
  description = "Azure Storage Name"
}

variable "account_tier" {
  description = "Azure Storage account account_tier"
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Azure account replication_type"
  default     = "GRS"
}

variable "share_names" {
  type    = list(string)
  default = ["share-1", "share-2"]
}
variable "tags" {
  type    = map(string)
  default = {}
}
