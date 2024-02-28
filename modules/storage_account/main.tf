
resource "azurerm_storage_account" "storageacc" {
  for_each = var.storage_acc_config
  resource_group_name      = var.resource_group_name
  location                 = var.location

  name                     = "ssnast${var.product}${terraform.workspace}${var.location}${each.key}" 
   #each.value. #tfsdevccaeusloghicapp
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  allow_nested_items_to_be_public = each.value.allow_blob_public_access


  blob_properties {
    versioning_enabled = each.value.versioning_enabled
  } 
  


 #disabling public access over internet
  public_network_access_enabled = each.value.public_network_access_enabled
    
}

