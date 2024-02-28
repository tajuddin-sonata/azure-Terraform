#The location and product
variable "location" {
  type = string
  default = ""
}

# variable "resource_group_name" {
#   type = string
#   default = ""
# }

variable "product" {
  type = any
  default = ""
}

#Application Insights Configuration along with the workspace id of the loganalytics workspace
variable "appinsights_config" {
  type = object({
    # appname = string
    apptype = string
  })
}

variable "workspace_id" {
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


#App Service Plan Configuration
variable "appservice_config" {
    type = object({
        # app_service_name = string
        os_type = string
        sku_name = any
        zone_enable = bool
        worker_count = any
        max_worker = any
    })
}

variable "app_service_id" {
    type = any
    default = ""
}


#Storage Account Configuration
variable "storage_acc_config" {
    description = "configration of the storage account"
    type = map(object({
    # storage_acc_name = string,
    account_tier = optional(string,"Standard"),
    account_replication_type = optional(string, "LRS"),
    public_network_access_enabled = optional(bool, false)
    allow_blob_public_access = optional(bool,false)
    versioning_enabled = optional(bool,false)
    
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


#Logic App Configuration
# variable "logic_app_config" {
#     type = map(object({
#         name = string
#         FUNCTIONS_WORKER_RUNTIME = any
#         WEBSITE_NODE_DEFAULT_VERSION = any
#         # public_network_access_enabled = bool
#     }))
# }

# variable "logic_app_config" {
#     type = map(object({
#         name = string
#         # FUNCTIONS_WORKER_RUNTIME = any
#         # WEBSITE_NODE_DEFAULT_VERSION = any
#         # APP_KIND = any
#         # AzureBlob_blobStorageEndpoint = any
#         # eventHub_connectionString = any
#         # Smtp_enableSSL =any
#         # Smtp_password = any
#         # Smtp_port = any
#         # Smtp_serverAddress = any
#         # Smtp_username = any
#         # public_network_access_enabled = bool
#     }))
# }

variable "logic_app_config" {
    type = map(object({
        # name = string
        FUNCTIONS_WORKER_RUNTIME = any
        FUNCTIONS_EXTENSION_VERSION = any
        WEBSITE_NODE_DEFAULT_VERSION = any
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

#Private Endpoint Configuration
# variable "private_endpoint_config" {
#     description = "configration of the storage account"
#     type = map(object({
#     # private_endpoint_name = string,
#     is_manual_connection = optional(bool, false)
#     subresource_names = list(string)

#   }))
# }

variable "is_manual_connection" {
  type = bool
  default = false
  
}

variable "resource_key" {
  type = map(any)
  default = {
    
  }
}

#the subnet under which the private endpoint should be
variable "subnet_id" {
  type = any
  default = ""
}


#DNS Configuration
variable "dns_a_record_config" {
  type = any
  default = ""
}

variable "ttl" {
  type = number
  default = 300
}

variable "private_dns_rg" {
  type = any
  default = ""
}

variable "service" {
  type = any
  default = ""
}

#Loganalytics
variable "log_name" {
  type = string
  default = ""
}

variable "sku" {
  type = any
  default = ""
}

variable "retention" {
  type = any
  default = ""
}

variable "resource_group_name" {
  type = any
  default = ""
}

variable "outbound_subnet" {
  type = any
  default = ""
}

variable "resource_principal_id" {
  type = any
  default = ""
}
 
variable "scope" {
  type = string
  default = ""
}
 
variable "role_definition_name" {
  type = string
  default = ""
}

variable "eventHub_connectionString" {
  type = any
  default = ""
}


# variable "link_name" {
#   type = string
#   default = ""
# }

# variable "private_dns_zone" {
#   type = any
#   default = ""
# }


# variable "registration_enabled" {
#     type = bool
#     default = false
  
# }
# variable "vnet_id" {
#   type = any
#   default = ""
# }

variable "enable_sites_pep" {
  type = bool
  default = false
  
}

variable "enable_blob_pep" {
  type = bool
  default = false
  
}

variable "enable_file_pep" {
  type = bool
  default = false
  
}

variable "enable_table_pep" {
  type = bool
  default = false
  
}


variable "enable_queue_pep" {
  type = bool
  default = false
  
}
