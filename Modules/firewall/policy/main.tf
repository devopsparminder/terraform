
resource "azurerm_firewall_policy" "policy" {
  name                = var.fw_policy_name
  resource_group_name = var.resource_group_name
  location            = var.location
    tags                = var.tags # diffent folder for fw policy
  
}