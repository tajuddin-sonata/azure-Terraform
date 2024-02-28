#Location
location = "eastus"
product = "cca"
resource_group_name = "ssna-rg-cca-dev-eus"
#Storage Account Configuration
storage_acc_config = { 
  
  "client" = {
        # storage_acc_name = "tfsstorageeusdars",
#       # account_tier = optional(string,"Standard"),
#       # account_replication_type = optional(string, "LRS"),
        public_network_access_enabled = false
        versioning_enabled = true

  }
}

#Private Endpoint Configuration
private_endpoint_config = {

blob={
  is_manual_connection = false,
  subresource_names = ["blob"]
  
},
file={
  is_manual_connection = false,
  subresource_names = ["file"]
}
}

subnet_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus/subnets/ssna-snet-dev-cca-eus-paas"
private_dns_rg = "ssna-rg-cca-dev-eus"

ttl = 300