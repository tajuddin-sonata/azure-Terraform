resource "azurerm_logic_app_standard" "logic_app" {
  for_each            = var.logic_app_config
  name                       = "ssna-logicapp-${var.product}-${terraform.workspace}-${var.location}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.lg_app_service_id
  storage_account_name       = var.lg_storage_account_name
  storage_account_access_key = var.lg_primary_access_key
  

  app_settings = {
    
    "WEBSITE_VNET_ROUTE_ALL"=1
    "WEBSITE_CONTENTOVERVNET"=1
    "FUNCTIONS_WORKER_RUNTIME"     = "${each.value.FUNCTIONS_WORKER_RUNTIME}"
    "WEBSITE_NODE_DEFAULT_VERSION" =  "${each.value.WEBSITE_NODE_DEFAULT_VERSION}"
    "FUNCTIONS_EXTENSION_VERSION" = "${each.value.FUNCTIONS_EXTENSION_VERSION}"
    "APP_KIND" = "${each.value.APP_KIND}"
    "AzureBlob_blobStorageEndpoint" = "https://sitlst${var.product}${terraform.workspace}${var.location}client.blob.core.windows.net"
    "eventHub_connectionString" = var.eventHub_connectionString
    "Smtp_enableSSL" = "${each.value.Smtp_enableSSL}"
    "Smtp_password" = "${each.value.Smtp_password}"
    "Smtp_port" = "${each.value.Smtp_port}"
    "Smtp_serverAddress" = "${each.value.Smtp_serverAddress}"
    "Smtp_username" = "${each.value.Smtp_username}"
  }

  identity {
    type = "SystemAssigned"
  }

  site_config{
    public_network_access_enabled = each.value.public_network_access_enabled
  }
}