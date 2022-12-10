# Create Firewall
module "firewall" {
  source              = "../Modules/firewall/manager"
  fw_name             = local.hub_fw_name
  location            = local.location_fullname
  fw_subnet_id        = data.azurerm_subnet.fw_subnet.id
  fw_public_ip_name   = local.hub_fw_public_ip_name
  firewall_policy_id  = data.azurerm_firewall_policy.fw_policy.id
  resource_group_name = local.rg_component_name
  tags                = var.tags
}

module "firewall_policy" {
  source              = "../Modules/firewall/policy"
  fw_policy_name      = local.hub_fw_policy_name
  location            = local.location_fullname
  resource_group_name = local.rg_component_name
}
