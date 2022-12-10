data "azurerm_subnet" "fw_subnet" {
  name                 = var.subnet_names[0]
  virtual_network_name = local.microsvc_vnet_name
  resource_group_name  = local.rg_component_name
  depends_on           = [module.vnet]
}
data "azurerm_firewall_policy" "fw_policy" {
  name                = local.hub_fw_policy_name
  resource_group_name = local.rg_component_name
  depends_on           = [module.hub_rg]
}