data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "front_door_profile" {
  source   = "Azure/avm-res-cdn-profile/azurerm"
  version  = "0.1.9"
  for_each = var.front_door_profiles

  name                         = each.value.name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  tags                         = coalesce(each.value.tags, var.tags)
  enable_telemetry             = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  response_timeout_seconds     = each.value.response_timeout_seconds
  sku                          = each.value.sku
  cdn_endpoints                = each.value.cdn_endpoints
  diagnostic_settings          = each.value.diagnostic_settings
  front_door_custom_domains    = each.value.front_door_custom_domains
  front_door_endpoints         = each.value.front_door_endpoints
  managed_identities           = each.value.managed_identities
  front_door_firewall_policies = each.value.front_door_firewall_policies
  front_door_secrets           = each.value.front_door_secrets
  lock                         = each.value.lock
  metric_alerts                = each.value.metric_alerts
  front_door_origin_groups     = each.value.front_door_origin_groups
  front_door_origins           = each.value.front_door_origins
  front_door_routes            = each.value.front_door_routes
  front_door_rule_sets         = each.value.front_door_rule_sets
  cdn_endpoint_custom_domains  = each.value.cdn_endpoint_custom_domains
  front_door_security_policies = each.value.front_door_security_policies
  role_assignments             = each.value.role_assignments
  front_door_rules             = each.value.front_door_rules
}

module "front_door_waf_policy" {
  source   = "Azure/avm-res-network-frontdoorwebapplicationfirewallpolicy/azurerm"
  version  = "0.1.1"
  for_each = var.front_door_waf_policies

  name                              = each.value.name
  resource_group_name               = var.resource_group_name
  tags                              = coalesce(each.value.tags, var.tags)
  enable_telemetry                  = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  sku_name                          = each.value.sku_name
  custom_block_response_body        = each.value.custom_block_response_body
  mode                              = each.value.mode
  custom_block_response_status_code = each.value.custom_block_response_status_code
  custom_rules                      = each.value.custom_rules
  lock                              = each.value.lock
  role_assignments                  = each.value.role_assignments
  enabled                           = each.value.enabled
  managed_rules                     = each.value.managed_rules
  redirect_url                      = each.value.redirect_url
  request_body_check_enabled        = each.value.request_body_check_enabled
}
