variable "resource_group_name" {
  description = "Azure resource group"
}

variable "location" {
  type = string
}
variable "tags" {
  type    = map(string)
  default = {}
}

variable "aks_cluster_name" {
  description = "Azure Kubernetes cluster name"
  type        = string
}

variable "dnsprefix" {
  type        = string
  default     = ""
  description = "The dns name of AKS"
}
/*
variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
  default     = 50
}
*/
variable "kubernetes_version" {
  description = "Specify which Kubernetes release to use. The default used is the 1.20.9"
  type        = string
  default     = "1.20.9"
}
variable "enable_auto_scaling" {
  description = "Enable node pool autoscaling"
  type        = bool
  default     = false
}
variable "agents_size" {
  default     = "Standard_D2_v2"
  description = "The default virtual machine size for the Kubernetes agents"
  type        = string
}
variable "agents_max_count" {
  type        = number
  description = "Maximum number of nodes in a pool"
  default     = null
}

variable "agents_min_count" {
  type        = number
  description = "Minimum number of nodes in a pool"
  default     = null
}
variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool. Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes."
  type        = number
  default     = 2
}

variable "enable_azure_policy" {
  description = "Enable Azure Policy Addon."
  type        = bool
  default     = false
}
variable "gateway_id" {

}

variable "nodepool_names" {
  description = "A list of node-pools"
  type        = list(string)
  default     = [ "node1", "node2" ]
}
variable "private_cluster_enabled" {
  description = "Enable private cluster."
  type        = bool
  default     = false
}
variable "vnet_subnet_id" {
  description = "Ip ranges allowed to interract with Kubernetes API. Default no restrictions"
}
variable "acr_name" {
  type        = string
  description = "ACR name"
}