#the product and location
location = "eastus"
product = "cca"
service = "func"
resource_group_name = "ssna-rg-cca-dev-eus"
#Application Insights Configuration
appinsights_config = {
    # appname = "tfsfuncappinsights"
    apptype = "web"
}

#App Service Plan Configuration
appservice_config = {
    # app_service_name = "tfsfuncappservice"
    os_type = "Linux"
    sku_name = "P1v3"
    zone_enable = true
    worker_count = null
    max_worker = null
}

#Storage Account Configuration
storage_acc_config ={ 
  "func" = {
    # storage_acc_name = "tfsfuncappstg"
    account_tier = "Standard"
    account_replication_type = "LRS"
    # pe_enable = true
    public_network_access_enabled = false
    versioning_enabled = true
    # allow_blob_public_access = true
}}

#Function App Configuration
func_app_config = {
  
  wftrigger = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
    public_network_access_enabled = true
  },

  wfconfigure = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
  },

  wftranscode = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
    LD_LIBRARY_PATH = "/home/site/wwwroot/audiowaveform"
  },

  wftranscribe = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
  },

  wfanalyse = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
  },

  wfredact = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
  }

}



#Private Endpoint Configuration
# private_endpoint_config = {

# sites={
#   is_manual_connection = false,
#   subresource_names = ["sites"]
  
# },
# blob={
#   is_manual_connection = false,
#   subresource_names = ["blob"]
# },
# file={
#   is_manual_connection = false,
#   subresource_names = ["file"]
# }
# }

enable_sites_pep = true
enable_blob_pep = true
enable_file_pep = true
enable_queue_pep = true
enable_table_pep = true

#DNS Configuration/Time to Live
ttl = 300

# Loganalytics
log_name = "tfsloganalytics"
sku = "PerGB2018"
retention = "30"

private_dns_rg = "ssna-rg-cca-dev-eus"


subnet_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus/subnets/ssna-snet-dev-cca-eus-paas"
outbound_subnet = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus/subnets/ssna-snet-dev-cca-eus-func-outbound"
scope = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus"

link_name = "vnet_link"
private_dns_zone = "privatelink.azurewebsites.net"
private_dns_zone_storage = "privatelink.blob.core.windows.net"
private_dns_zone_storage_file = "privatelink.file.core.windows.net"
vnet_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus"