#the product and location
location = "eastus"
product = "cca"
service = "logic"
resource_group_name = "ssna-rg-cca-dev-eus"

#Application Insights Configuration

appinsights_config = {
    # appname = "tfslogicappinsights"
    apptype = "web"
}

#App Service Plan Configuration
appservice_config = {
    # app_service_name = "tfslogserviceplan"
    os_type = "Windows"
    sku_name = "WS2"
    zone_enable = true
    worker_count = "3"
    max_worker = "3"
}

#Storage Account Configuration

storage_acc_config ={ 
  "logic" = {
    # storage_acc_name = "sitldevstg2202logic"
    account_tier = "Standard"
    account_replication_type = "LRS"
    # pe_enable = true
    public_network_access_enabled = false
}}

#Logic App Configuration
logic_app_config = {
  logicapp = {
    # name = "dev-logicapp-sitl-eus"
    FUNCTIONS_WORKER_RUNTIME = "node"
    FUNCTIONS_EXTENSION_VERSION = "~4"
    WEBSITE_NODE_DEFAULT_VERSION = "~18"
    APP_KIND = "workflowApp"
    # AzureBlob_blobStorageEndpoint = "https://sitldevstg2202cust.blob.core.windows.net"
    # eventHub_connectionString = "Endpoint=sb://sitleventhubnamespace.servicebus.windows.net/;SharedAccessKeyName=sendpolicy;SharedAccessKey=HJyeohwmOmo7P33prre3wRheH0uYvukPE+AEhKrV7jw=;EntityPath=sitleventhub"
    Smtp_enableSSL = true
    Smtp_password = "Gita@1998"
    Smtp_port = 587
    Smtp_serverAddress = "smpt.office365.com"
    Smtp_username = "saurav.padhy@sonata-software.com"
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
enable_table_pep = true
enable_queue_pep = true

#DNS Configuration/Time to Live
ttl = 300

private_dns_rg = "ssna-rg-cca-dev-eus"


subnet_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus/subnets/ssna-snet-dev-cca-eus-paas"
outbound_subnet = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus/subnets/ssna-snet-dev-cca-eus-logicapp-outbound"
scope = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus"

eventHub_connectionString = "Endpoint=sb://ssna-eventhubnamespace-cca-dev-eastus.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=lZT1Uo7gMEqrbtdlejw3hUsZGHzFabKcw+AEhN1Y7rg="

# Loganalytics
log_name = "tfsloganalyticss"
sku = "PerGB2018"
retention = "30"

# link_name = "logicapp_link"
# private_dns_zone = "privatelink.azurewebsites.net"
# vnet_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus"
# workspace_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourcegroups/ssna-rg-cca-dev-eus/providers/microsoft.operationalinsights/workspaces/tfsloganalytics"