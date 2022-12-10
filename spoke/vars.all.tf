
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
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}
variable "agents_max_count" {
  type        = number
  description = "Maximum number of nodes in a pool"
  default     = 5
}
variable "agents_min_count" {
  type        = number
  description = "Minimum number of nodes in a pool"
  default     = 2
}
variable "agents_size" {
  default     = "Standard_D2_v2"
  description = "The default virtual machine size for the Kubernetes agents"
  type        = string
}
variable "enable_azure_policy" {
  description = "Enable Azure Policy Addon."
  type        = bool
  default     = false
}
variable "enable_auto_scaling" {
  description = "Enable node pool autoscaling"
  type        = bool
  default     = false
}
variable "private_cluster_enabled" {
  description = "Enable private cluster."
  type        = bool
  default     = false
}
variable "acr_name" {
  type        = string
  description = "ACR name"
}
variable "nodepool_names" {
  description = "A list of node-pools"
  type        = list(string)
  default     = ["node1", "node2"]
}
variable "nsg_names" {
  type    = list(string)
  default = ["nsg-1", "nsg-2"]
}
