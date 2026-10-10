output "front_door_profiles" {
  description = "Map (same keys as var.front_door_profiles) of every output from each Front Door (Standard/Premium) profiles -- set sku_name to Standard_AzureFrontDoor or Premium_AzureFrontDoor created -- see upstream module docs for the full shape."
  value       = module.front_door_profile
}

output "front_door_waf_policies" {
  description = "Map (same keys as var.front_door_waf_policies) of every output from each Front Door WAF policies created -- see upstream module docs for the full shape."
  value       = module.front_door_waf_policy
}
