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

variable "product" {
  type = string
  default = ""

}
variable "location" {
    description = "location of the storage account"
    type = string
  
}

variable "resource_group_name" {
    description = "product it is deployed for"
    type = string
  
}

