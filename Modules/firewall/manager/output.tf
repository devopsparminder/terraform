output "firewall_id" {
  value = resource.azurerm_firewall.firewall.id
}

output "firewall_name" {
  value = resource.azurerm_firewall.firewall.name
}

output "firewall_private_ip" {
  value = resource.azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}

output "firewall_public_ip" {
  value = resource.azurerm_public_ip.firewall.ip_address
}

