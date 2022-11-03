terraform {
  required_providers {
    ibm = {
      source = "JonWoodlief/catalog"
      version = "3.0.0"
    }
  }
}

# Configure the IBM Provider
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
}

data "ibm_cm_preset" "get_presets" {
  count = var.preset_id != "" && var.preset_id != null ? 1 : 0
  id = var.preset_id
}

locals {
  override = {
    override = jsondecode("{}")
    preset_overrides = jsondecode(var.preset_id != "" ? data.ibm_cm_preset.get_presets[0].preset : "{}")
  }
  override_type = var.preset_id != "" && var.preset_id != null ? "preset_overrides" : "override"

  name = lookup(local.override[local.override_type], "name", var.name)
}

data "template_file" "test" {
  template = "Hello ${local.name}!"
}
