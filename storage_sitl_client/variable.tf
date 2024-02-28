#Location and Product
variable "location" {
    description = "location of the storage account"
    type = string
  
}

variable "product" {
  type = any
  default = "sitl"
}


#Resource group where the storage account should be placed
variable "resource_group_name" {
    description = "product it is deployed for"
    type = string
    default = ""
  
}

#Storage account configuration
# variable "storage_acc_config" {
#     description = "configration of the storage account"
#     type = map(object({
#     storage_acc_name = string,
#     account_tier = optional(string,"Standard"),
#     account_replication_type = optional(string, "LRS"),
#     public_network_access_enabled = optional(bool, false)
    
#   }))
# }

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


#Private Endpoint Configuration
variable "private_endpoint_config" {
    description = "configration of the storage account"
    type = map(object({
    # private_endpoint_name = string,
    is_manual_connection = optional(bool, false)
    subresource_names = list(string)

  }))
}

variable "resource_key" {
  type = map(any)
  default = {}
  
}

#the subnet under which the private endpoint should be
variable "subnet_id" {
  type = any
  default = ""

}


#DNS Record Addition
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