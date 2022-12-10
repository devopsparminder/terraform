location_fullname  = "West US 2"
location_shortname = "we2"
environment        = "poc"
location                       = "West US 2"
virtual_network_address_prefix = "172.17.0.0/16"
subnet_names                = ["AzureFirewallSubnet","subnet-2"] #name
subnet_prefixes                 = ["172.17.1.0/24","172.17.2.0/24"]
tags                            = {
    environment                 = "dev"
    project                     = "cc"
}