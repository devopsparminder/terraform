resource "azurerm_route_table" "rtb" {
  name                = var.rtb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  route {
    name                   = "cc-rtb"
    address_prefix         = "10.100.0.0/14"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.1.1"
  }
}

resource "azurerm_subnet_route_table_association" "rtb_association" {
  subnet_id      = var.subnet_id
  route_table_id = azurerm_route_table.rtb.id
}