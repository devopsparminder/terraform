data "azurerm_subnet" "kubesubnet" {
  name                 = var.subnet_names[0]
  virtual_network_name = local.microsvc_vnet_name
  resource_group_name  = local.rg_component_name
  depends_on           = [module.vnet]
}
data "azurerm_subnet" "gatewaysubnet" {
  name                 = var.subnet_names[4]
  virtual_network_name = local.microsvc_vnet_name
  resource_group_name  = local.rg_component_name
  depends_on           = [module.vnet]
}
data "azurerm_application_gateway" "app_gw" {
  name                = local.appgw_name
  resource_group_name = local.rg_component_name
  depends_on          = [module.application-gateway]
}
data "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  virtual_network_name = local.microsvc_vnet_name
  resource_group_name  = local.rg_component_name
  depends_on           = [module.vnet]
}
# data "azurerm_network_security_group" "nsg" {
#   count               = length(var.nsg_names)
#   name                = var.nsg_names[count.index]
#   resource_group_name = local.rg_component_name
#   depends_on          = [module.vnet]
# }