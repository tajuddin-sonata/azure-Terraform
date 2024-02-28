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
  default = {
    
  }
}

variable "location" {
    description = "location of the storage account"
    type = string
  
}

variable "resource_group_name" {
    description = "product it is deployed for"
    type = string 
}

variable "subnet_id" {
  type = any
  default = ""
}
