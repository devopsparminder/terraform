module "vnet" {
  source                         = "../Modules/networking/vnet"
  resource_group_name            = local.rg_component_name
  location                       = var.location
  virtual_network_name           = local.microsvc_vnet_name
  virtual_network_address_prefix = var.virtual_network_address_prefix
  subnet_names                   = var.subnet_names
  subnet_prefixes                = var.subnet_prefixes
  tags                           = var.tags
  depends_on                     = [module.rg]
}

module "nsg" {
  source              = "../Modules/networking/nsg"
  resource_group_name = local.rg_component_name
  location            = var.location
  nsg_names           = var.nsg_names
  subnet_id           = data.azurerm_subnet.subnets.*.id
  depends_on              = [module.rg, module.vnet]
}