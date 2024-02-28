module "storage_acc" {
    source = "../modules/storage_account"
    resource_group_name = var.resource_group_name
    location = var.location
    storage_acc_config = var.storage_acc_config
    product = var.product
  
}

module "private_endpoint" {
    source = "../modules/private_end_point"
    resource_group_name = var.resource_group_name
    location = var.location
    private_endpoint_config = var.private_endpoint_config
    resource_key = module.storage_acc.storageaccount_resource_id
    subnet_id = var.subnet_id
}


module "dns_a_record" {
    source = "../modules/dns_a_record"
    private_dns_rg = var.private_dns_rg
    dns_a_record_config = module.private_endpoint.private_end_point_IP_address
    ttl = var.ttl
  
}