
##############################################
#log analytics
##############################################

module "loganalytics" {
  source = "../modules/loganalytics"

  location = var.location
  product = var.product
resource_group_name = var.resource_group_name
  log_name = var.log_name
  retention = var.retention
  sku = var.sku
}

##############################################
#app insights
##############################################
module "app_insights" {
    source = "../modules/appinsights"

    appinsights_config = var.appinsights_config
    location = var.location
    resource_group_name = var.resource_group_name
     workspace_id = module.loganalytics.log_id
     service = var.service
     product = var.product
     
     depends_on = [ module.loganalytics ]
}

##############################################
#app service
##############################################

module "app_service" {
    source = "../modules/appservice"
    appservice_config = var.appservice_config
    location = var.location
    resource_group_name = var.resource_group_name
    product = var.product
    service = var.service

}

##############################################
#function App Storage
##############################################

module "func_app_storage" {
    source = "../modules/storage_account"
    storage_acc_config = var.storage_acc_config
    resource_group_name = var.resource_group_name
    location = var.location
    product = var.product
}


module "functionapp_storage_private_endpoint" {
    source = "../modules/tfs_azurerm_pep"
    # private_endpoint_config = var.private_endpoint_config
    resource_group_name = var.resource_group_name
    location = var.location
    resource_key = module.func_app_storage.storageaccount_resource_id
    subnet_id = var.subnet_id
    enable_blob_pep = var.enable_blob_pep
    enable_file_pep = var.enable_file_pep
    enable_queue_pep = var.enable_queue_pep
    enable_table_pep = var.enable_table_pep
    
}

module "dns_a_record_function_app_storage" {
  source = "../modules/dns_a_record"
  private_dns_rg = var.private_dns_rg
  ttl = var.ttl
  dns_a_record_config = module.functionapp_storage_private_endpoint.private_end_point_IP_address
  
}

###############################################################
#function app
################################################################

module "function_app" {
    source = "../modules/function_app"
    func_app_config = var.func_app_config
    location = var.location
    resource_group_name = var.resource_group_name
    storage_account_name = join(",",module.func_app_storage.storage_account_name)
    primary_access_key = join(",",module.func_app_storage.storage_account_key)
    app_service_id = module.app_service.app_service_id
    instrumentation_key = module.app_insights.app_insights_instrument_key
    connection_string =   module.app_insights.app_insights_connection
    product = var.product
}

module "function_app_private_end_point" {
    source = "../modules/tfs_azurerm_pep"
    # private_endpoint_config = var.private_endpoint_config
    resource_group_name = var.resource_group_name
    location = var.location
    resource_key = module.function_app.function_app_id
    subnet_id = var.subnet_id
    enable_sites_pep = var.enable_sites_pep
}

module "dns_a_record" {
  source = "../modules/dns_a_record"
  private_dns_rg = var.private_dns_rg
  ttl = var.ttl
  dns_a_record_config = module.function_app_private_end_point.private_end_point_IP_address
  
}


module "vnet-link" {
  source = "../modules/vnet_integration"

  vnet_integeration_config = module.function_app.function_app_id
  outbound_subnet = var.outbound_subnet #module.subnet.outbound_subnet #the subnet which is used for function app vnet linking
}


module "IAM" {
    source = "../modules/iam"
  resource_principal_id = module.function_app.function_app_principal_id
  scope = var.scope
  role_definition_name = "storage blob data contributor"
}

############################################################
#vnet linking with DNS ZONE
############################################################

module "dns_vnet_link_function" {
  source = "../modules/vnet_linking"

  link_name = var.link_name
  private_dns_rg = var.private_dns_rg
  private_dns_zone = var.private_dns_zone
  vnet_id = var.vnet_id
  registration_enabled =var.registration_enabled

}

module "dns_vnet_link_storage_blob" {
  source = "../modules/vnet_linking"

  link_name = var.link_name
  private_dns_rg = var.private_dns_rg
  private_dns_zone = var.private_dns_zone_storage
  vnet_id = var.vnet_id
  registration_enabled =var.registration_enabled

}

module "dns_vnet_link_file_storage_func" {
  source = "../modules/vnet_linking"

  link_name = var.link_name
  private_dns_rg = var.private_dns_rg
  private_dns_zone = var.private_dns_zone_storage_file
  vnet_id = var.vnet_id
  registration_enabled =var.registration_enabled

}

module "dns_vnet_link_queue_storage_func" {
  source = "../modules/vnet_linking"

  link_name = var.link_name
  private_dns_rg = var.private_dns_rg
  private_dns_zone = "privatelink.queue.core.windows.net"
  vnet_id = var.vnet_id
  registration_enabled =var.registration_enabled

}

module "dns_vnet_link_table_storage_func" {
  source = "../modules/vnet_linking"

  link_name = var.link_name
  private_dns_rg = var.private_dns_rg
  private_dns_zone = "privatelink.table.core.windows.net"
  vnet_id = var.vnet_id
  registration_enabled =var.registration_enabled

}