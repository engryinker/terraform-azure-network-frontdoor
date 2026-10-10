variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "front_door_profiles" {
  description = "Map of Front Door (Standard/Premium) profiles -- set sku_name to Standard_AzureFrontDoor or Premium_AzureFrontDoor to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-cdn-profile/azurerm v0.1.9 (https://registry.terraform.io/modules/Azure/avm-res-cdn-profile/azurerm/0.1.9) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                         = string
    tags                         = optional(map(string))
    enable_telemetry             = optional(bool)
    response_timeout_seconds     = optional(number, null)
    sku                          = optional(string, null)
    cdn_endpoints                = optional(any, null)
    diagnostic_settings          = optional(any, null)
    front_door_custom_domains    = optional(any, null)
    front_door_endpoints         = optional(any, null)
    managed_identities           = optional(any, null)
    front_door_firewall_policies = optional(any, null)
    front_door_secrets           = optional(any, null)
    lock                         = optional(any, null)
    metric_alerts                = optional(any, null)
    front_door_origin_groups     = optional(any, null)
    front_door_origins           = optional(any, null)
    front_door_routes            = optional(any, null)
    front_door_rule_sets         = optional(set(string), null)
    cdn_endpoint_custom_domains  = optional(any, null)
    front_door_security_policies = optional(any, null)
    role_assignments             = optional(any, null)
    front_door_rules             = optional(any, null)
  }))
  default = {}
}

variable "front_door_waf_policies" {
  description = "Map of Front Door WAF policies to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-network-frontdoorwebapplicationfirewallpolicy/azurerm v0.1.1 (https://registry.terraform.io/modules/Azure/avm-res-network-frontdoorwebapplicationfirewallpolicy/azurerm/0.1.1) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                              = string
    tags                              = optional(map(string))
    enable_telemetry                  = optional(bool)
    sku_name                          = string
    custom_block_response_body        = optional(string, null)
    mode                              = string
    custom_block_response_status_code = optional(number, null)
    custom_rules                      = optional(any, null)
    lock                              = optional(any, null)
    role_assignments                  = optional(any, null)
    enabled                           = optional(bool, null)
    managed_rules                     = optional(any, null)
    redirect_url                      = optional(string, null)
    request_body_check_enabled        = optional(bool, null)
  }))
  default = {}
}
