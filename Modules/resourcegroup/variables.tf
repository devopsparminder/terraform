variable "resource_group_name" {
  type        = string
  description = "(Required) Resource group name"
}

variable "location" {
  type        = string
  description = "(Required) Location short name"
}
variable "tags" {
  type    = map(string)
  default = {}
}
