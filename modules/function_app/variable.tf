variable "location" {
  type = string
  default = ""
}

variable "resource_group_name" {
  type = string
  default = ""
}

variable "func_app_config" {
    type = map(object({
        # function_app_name = string
        pyversion = string
        ApplicationInsightsAgent_EXTENSION_VERSION = optional(string,"~3")
        LD_LIBRARY_PATH = optional(string,null)
        public_network_access_enabled = optional(bool,false)
        # app_settings = map(any)
    }))
}

variable "storage_account_name" {
    type = any
    default = ""
}

variable "primary_access_key" {
    type = any
    default = ""
}

variable "app_service_id" {
    type = any
    default = ""
}

variable "instrumentation_key" {
    type = any
    default = ""
}

variable "connection_string" {
    type = any
    default = ""
}

variable "product" {
  type = any
  default = ""
}