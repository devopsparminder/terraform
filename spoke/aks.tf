module "aks" {
  source = "../Modules/aks-cluster"

  aks_cluster_name        = local.aks_name
  resource_group_name     = local.rg_component_name
  kubernetes_version      = var.kubernetes_version
  location                = var.location
  dnsprefix               = local.aks_name
  vnet_subnet_id          = data.azurerm_subnet.kubesubnet.id
  agents_size             = var.agents_size
  enable_auto_scaling     = var.enable_auto_scaling
  private_cluster_enabled = var.private_cluster_enabled
  agents_count            = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
  agents_max_count        = var.agents_max_count
  agents_min_count        = var.agents_min_count
  enable_azure_policy     = var.enable_azure_policy
  acr_name                = var.acr_name
  gateway_id              = data.azurerm_application_gateway.app_gw.id
  nodepool_names          = var.nodepool_names
  depends_on              = [module.rg]
  tags                    = var.tags
}