# Configure these variables

variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  default = ""
}
variable "name" {
  description = "The name to pass to the template."
  default     = "world"
}

variable "preset_id" {
  description = "The ID of the preset configuration to be used with this module"
  default = ""
}
