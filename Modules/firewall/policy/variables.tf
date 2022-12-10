variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "fw_policy_name" {
  type        = string
  description = "Specifies the name of Firewall Policy"
}
variable "tags" {
  type    = map(string)
  default = {}
}