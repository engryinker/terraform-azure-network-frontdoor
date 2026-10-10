terraform {
  required_version = ">= 1.7.0"
}

module "network-frontdoor" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  front_door_profiles     = {} # see README Inputs table / upstream module docs for the per-entry schema
  front_door_waf_policies = {} # see README Inputs table / upstream module docs for the per-entry schema
}
