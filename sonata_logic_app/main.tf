# data "terraform_remote_state" "ehub-connectionstring" {
#   backend = "local"

#   config = {
#     path = "../sitl_eventhub/terraform.tfstate"
#   }
# }

# locals {
#   value = data.terraform_remote_state.ehub-connectionstring.outputs.sas_key_map
# }


module "loganalytics" {
  source = "../modules/loganalytics"

  location = var.location
  product = var.product
resource_group_name = var.resource_group_name
  log_name = var.log_name
  retention = var.retention
  sku = var.sku
}

module "app_insights" {
    source = "../modules/appinsights"

    appinsights_config = var.appinsights_config
    location = var.location
    resource_group_name = var.resource_group_name
    service = var.service 
    workspace_id = module.loganalytics.log_id

    depends_on = [ module.loganalytics ]
}

module "app_service" {
    source = "../modules/appservice"
    appservice_config = var.appservice_config
    location = var.location
    resource_group_name = var.resource_group_name
    product = var.product
    service = var.service

}

module "logic_app_storage" {
    source = "../modules/storage_account"
    storage_acc_config = var.storage_acc_config
    resource_group_name = var.resource_group_name
    location = var.location
    product = var.product
}


module "logic_app" {
    source = "../modules/logic_app"
    logic_app_config = var.logic_app_config
    location = var.location
    lg_app_service_id = module.app_service.app_service_id
    lg_primary_access_key = join(",",module.logic_app_storage.storage_account_key)
    lg_storage_account_name = join(",",module.logic_app_storage.storage_account_name)
    resource_group_name = var.resource_group_name
    product = var.product
    eventHub_connectionString = var.eventHub_connectionString
  
}

module "logic_pep" {
    source = "../modules/tfs_Azurerm_pep"
    # private_endpoint_config = var.private_endpoint_config
    resource_group_name = var.resource_group_name
    location = var.location
    resource_key = module.logic_app.logic_ids
    subnet_id = var.subnet_id
    enable_sites_pep = var.enable_sites_pep
}


module "pep_logicstorage" {
  source = "../modules/tfs_Azurerm_pep"
    # private_endpoint_config = var.private_endpoint_config
    resource_group_name = var.resource_group_name
    location = var.location
    resource_key = module.logic_app_storage.storageaccount_resource_id
    subnet_id = var.subnet_id
    enable_blob_pep = var.enable_blob_pep
    enable_file_pep = var.enable_file_pep
    enable_queue_pep = var.enable_queue_pep
    enable_table_pep = var.enable_table_pep
}

module "storage_dns_a_record" {
  source = "../modules/dns_a_record"
  private_dns_rg = var.private_dns_rg
  ttl = var.ttl
  dns_a_record_config = module.pep_logicstorage.private_end_point_IP_address
}

module "dns_a_record" {
  source = "../modules/dns_a_record"
  private_dns_rg = var.private_dns_rg
  ttl = var.ttl
  dns_a_record_config = module.logic_pep.private_end_point_IP_address
  
}

module "vnet-link" {
  source = "../modules/vnet_integration"

  vnet_integeration_config = module.logic_app.logic_ids
  outbound_subnet = var.outbound_subnet #the subnet which is used for logicapp vnet linking
}

module "IAM" {
    source = "../modules/iam"
  resource_principal_id = module.logic_app.logic_app_principal_id
  scope = var.scope
  role_definition_name = "storage blob data contributor"
}

# module "dns_vnet_link" {
#   source = "../modules/vnet_linking"

#   link_name = var.link_name
#   private_dns_rg = var.private_dns_rg
#   private_dns_zone = var.private_dns_zone
#   vnet_id = var.vnet_id
#   registration_enabled =var.registration_enabled

# }