resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_cluster_name
  private_cluster_enabled = var.private_cluster_enabled

  default_node_pool {
    name                  = "system"
    node_count            = var.enable_auto_scaling == true ? null : var.agents_count
    vm_size               = var.agents_size
    vnet_subnet_id        = var.vnet_subnet_id
    enable_auto_scaling   = var.enable_auto_scaling
    max_count             = var.enable_auto_scaling == false ? null : var.agents_max_count
    min_count             = var.enable_auto_scaling == false ? null : var.agents_min_count
    enable_node_public_ip = false
    availability_zones    = [1, 2, 3]
    type                  = "VirtualMachineScaleSets"
    tags                  = var.tags
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
  }
  addon_profile {
    ingress_application_gateway {
      enabled    = "true"
      gateway_id = var.gateway_id
    }
  }
  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "azure" # azure (CNI)
    outbound_type     = "loadBalancer"
    network_policy    = "calico"
  }
}
resource "azurerm_kubernetes_cluster_node_pool" "user_nodepool" {
  count                 = length(var.nodepool_names)
  name                  = var.nodepool_names[count.index]
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 2

}
resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}
