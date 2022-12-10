data azurerm_virtual_network "vnet"{
  name             = "csg-poc-we2-vnet"
  resource_group_name = "csg-poc-we2-rg"
}


resource "azurerm_subnet" "gatewaysubnet" {
  name                                           = "gatewaysubnet"
  resource_group_name                            = "csg-poc-we2-rg"
  virtual_network_name                           = data.azurerm_virtual_network.vnet.name
  address_prefixes                               = ["10.0.6.0/24"]
}
module "application-gateway" {
  source              = "../Modules/appgateway"
  name                = local.appgw_name
  resource_group_name = local.rg_component_name
  location            = var.location
  tags                = var.tags
  sku = {
    tier     = "WAF_v2"
    name     = "WAF_v2"
    capacity = 2
  }
  subnet_id                     = azurerm_subnet.gatewaysubnet.id
  frontend_ip_configuration     = { name = local.frontend_ip_configuration_name }
  public_ip                     = local.public_ip #mahesh create pub ip before                  
  gateway_ip_configuration_name = local.gateway_ip_configuration_name

  frontend_port = {
    name = local.frontend_port_name
  }
  backend_address_pool_name      = local.backend_address_pool_name
  frontend_port_name             = local.frontend_port_name
  http_setting_name              = local.http_setting_name
  frontend_ip_configuration_name = local.frontend_ip_configuration_name
  request_routing_rule           = local.request_routing_rule
  listener_name                  = local.listener_name
}
