# variable "logic_app_config" {
#     type = map(object({
#         name = string
#         FUNCTIONS_WORKER_RUNTIME = any
#         WEBSITE_NODE_DEFAULT_VERSION = any
#         # public_network_access_enabled = bool
#     }))
# }

variable "product" {
  type = any
  default = ""
}

# variable "eventHub_connectionString" {
#   type = string
#   default = ""
# }
variable "logic_app_config" {
    type = map(object({
        # # name = string
        FUNCTIONS_WORKER_RUNTIME = any
        WEBSITE_NODE_DEFAULT_VERSION = any
        FUNCTIONS_EXTENSION_VERSION = any
        APP_KIND = any
        # AzureBlob_blobStorageEndpoint = any
        # eventHub_connectionString = any
        Smtp_enableSSL = bool
        Smtp_password = any
        Smtp_port = any
        Smtp_serverAddress = any
        Smtp_username = any
        public_network_access_enabled = optional(bool,false)
    }))
}


variable "location" {
    type =any
    default = ""
}

# variable "product" {
#     type = any
# }

variable "resource_group_name" {
  type = any
  default = ""
}

variable "lg_app_service_id" {
    type = any
    default = ""
}

variable "lg_storage_account_name" {
    type = any
    default = ""
}

variable "lg_primary_access_key" {
    type = any
    default = ""
}


variable "eventHub_connectionString" {
  type = any
  default = ""
}