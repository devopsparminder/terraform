resource "azurerm_storage_account" "sto_ac" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}
resource "azurerm_storage_share" "sto_share" {
  count                = length(var.share_names)
  name                 = var.share_names[count.index]
  storage_account_name = azurerm_storage_account.sto_ac.name
  quota                = 256

  acl {
    id = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"

    access_policy {
      permissions = "rwdl"
    }
  }
}
