locals {
  location_fullname = lower(trimspace(var.location_fullname))
  component_name    = "csg-${lower(var.environment)}-${lower(var.location_shortname)}-%s"
  rg_component_name = "csg-${lower(var.environment)}-${lower(var.location_shortname)}-rg"
  #tags
  common_tags = {
    Project = "csg"
  }
  # resource group
  microsvc_vnet_name = format(local.component_name, "vnet")
  aks_name           = format(local.component_name, "aks")
  storage_name       = "csgdevwe2sa"



  #application gateway config
  appgw_name                     = format(local.component_name, "agw")
  backend_address_pool_name      = format(local.component_name, "backend")
  frontend_port_name             = "http"
  http_setting_name              = "http-setting"
  frontend_ip_configuration_name = format(local.component_name, "fip")
  request_routing_rule           = "cc-rule"
  listener_name                  = "http"
  gateway_ip_configuration_name  = format(local.component_name, "gip")
  public_ip                      = format(local.component_name, "apgw_pip") #Mahesh
}

