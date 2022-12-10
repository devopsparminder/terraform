resource "azurerm_network_security_group" "nsg" {
  count               = length(var.nsg_names)
  name                = var.nsg_names[count.index]                
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "cc-nsg-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  count = length(var.subnet_id)  
  subnet_id                 = var.subnet_id[count.index]
  network_security_group_id = element(azurerm_network_security_group.nsg.*.id, count.index)
}