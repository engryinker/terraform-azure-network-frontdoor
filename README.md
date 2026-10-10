# terraform-azure-network-frontdoor

Org-standard Terraform wrapper for: **Front Door (Standard/Premium) profiles -- set sku_name to Standard_AzureFrontDoor or Premium_AzureFrontDoor, Front Door WAF policies**.

This repo bundles 2 related upstream AVM modules into one wrapper, since they're normally deployed together.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/<org>/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/<org>/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "network-frontdoor" {
  source = "git::https://github.com/<org>/terraform-azure-network-frontdoor.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  front_door_profiles = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }

  front_door_waf_policies = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `front_door_profiles` (Front Door (Standard/Premium) profiles -- set sku_name to Standard_AzureFrontDoor or Premium_AzureFrontDoor)

Wraps [Azure/avm-res-cdn-profile/azurerm](https://registry.terraform.io/modules/Azure/avm-res-cdn-profile/azurerm/0.1.9) v0.1.9.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `response_timeout_seconds` | `number` | no |  |
| `sku` | `string` | no |  |
| `cdn_endpoints` | `any` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `front_door_custom_domains` | `any` | no |  |
| `front_door_endpoints` | `any` | no |  |
| `managed_identities` | `any` | no |  |
| `front_door_firewall_policies` | `any` | no |  |
| `front_door_secrets` | `any` | no |  |
| `lock` | `any` | no |  |
| `metric_alerts` | `any` | no |  |
| `front_door_origin_groups` | `any` | no |  |
| `front_door_origins` | `any` | no |  |
| `front_door_routes` | `any` | no |  |
| `front_door_rule_sets` | `set(string)` | no |  |
| `cdn_endpoint_custom_domains` | `any` | no |  |
| `front_door_security_policies` | `any` | no |  |
| `role_assignments` | `any` | no |  |
| `front_door_rules` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

### `front_door_waf_policies` (Front Door WAF policies)

Wraps [Azure/avm-res-network-frontdoorwebapplicationfirewallpolicy/azurerm](https://registry.terraform.io/modules/Azure/avm-res-network-frontdoorwebapplicationfirewallpolicy/azurerm/0.1.1) v0.1.1.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `sku_name` | `string` | yes |  |
| `custom_block_response_body` | `string` | no |  |
| `mode` | `string` | yes |  |
| `custom_block_response_status_code` | `number` | no |  |
| `custom_rules` | `any` | no |  |
| `lock` | `any` | no |  |
| `role_assignments` | `any` | no |  |
| `enabled` | `bool` | no |  |
| `managed_rules` | `any` | no |  |
| `redirect_url` | `string` | no |  |
| `request_body_check_enabled` | `bool` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `front_door_profiles` -- map (same keys as the input) of every output from each created Front Door (Standard/Premium) profiles -- set sku_name to Standard_AzureFrontDoor or Premium_AzureFrontDoor.

- `front_door_waf_policies` -- map (same keys as the input) of every output from each created Front Door WAF policies.
