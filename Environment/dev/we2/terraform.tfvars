location_fullname               = "West US 2"
location_shortname              = "we2"
environment                     = "poc"
location                        = "West US 2"
kubernetes_version              = "1.24.6"
private_cluster_enabled         = true
enable_auto_scaling             = true
agents_max_count                = 3
agents_min_count                = 2
agents_size                     = "Standard_D2s_v3"
acr_name                        = "csgdemoregistry"
subnet_names                    = ["sys-pool-snet","www-pool-snet","app-pool-snet","db-pool-snet","gatewaysubnet"]
virtual_network_address_prefix  = "10.0.0.0/16" # IP Range Bala
subnet_prefixes                 = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24","10.0.6.0/24"]
nodepool_names                  = [ "webnodepool","appnodepool" ]
#storage_name                    = "csgdevwe2sa"
share_names                     = [ "csg-dev-conf", "csg-dev-logs" ]
nsg_names                       = ["sys-pool-nsg","www-pool-nsg","app-pool-nsg","db-pool-nsg","gatewaysubnet-nsg"]
tags                            = {
    environment                 = "poc"
    project                     = "cc"
}