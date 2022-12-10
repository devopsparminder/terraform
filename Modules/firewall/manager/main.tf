

resource "azurerm_public_ip" "firewall" {
  name                = var.fw_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags # diffent folder for fw policy 
}

resource "azurerm_firewall" "firewall" {
  name                = var.fw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  firewall_policy_id  = var.firewall_policy_id 

  sku_tier = var.sku_tier
  tags     = var.tags

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.fw_subnet_id
    public_ip_address_id = resource.azurerm_public_ip.firewall.id
  }
}