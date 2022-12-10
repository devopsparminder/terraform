module "rg" {
  source              = "../Modules/resourcegroup"
  resource_group_name = local.rg_component_name
  location            = var.location
  tags                = var.tags
}
