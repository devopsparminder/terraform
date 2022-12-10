module "storage" {
  source              = "../Modules/storage-account"
  resource_group_name = local.rg_component_name
  location            = var.location
  storage_name        = local.storage_name
  share_names         = var.share_names
  tags                = var.tags
}