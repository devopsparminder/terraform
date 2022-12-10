locals {

  location_fullname = lower(trimspace(var.location_fullname))
  component_name    = "csg-hub-${lower(var.environment)}-${lower(var.location_shortname)}-%s"
  rg_component_name = "csg-hub-${lower(var.environment)}-${lower(var.location_shortname)}-rg"
  #tags
  common_tags = {
    Project = "csg"
  }
  microsvc_vnet_name = format(local.component_name, "vnet")
  aks_name           = format(local.component_name, "aks")

  # Firewall
  hub_fw_name                  = format(local.component_name, "fw")
  hub_fw_policy_name           = format(local.component_name, "fwp")
  hub_fw_public_ip_name        = format(local.component_name, "pip")
  hub_fw_collection_group_name = format(local.component_name, "fw-cg1")
}

