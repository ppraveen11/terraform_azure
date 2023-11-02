variable "RG_NAME" {
  default = []
}
variable "RG_Location" {
  default = []
}
variable "RG_tags" {
  default = []
}
variable "Vnet_RG_NAME" {
  default = []
}
variable "Vnet_RG_Location" {
  default = []
}
variable "Vnet_address_space" {
  default = []
}
variable "dns_servers" {
  default = []
}
variable "Vnet_name" {
  default = []
}
variable "Vnet_tags" {
  default = []
}
variable "Peering_vnet_name" {
  default = []
}
variable "Peering_vnet_name_RG_NAME" {
  default = []
}
variable "Peering_vnet_name_Vnet_name" {
  default = []
}
variable "Peering_vnet_name2" {
  default = []
}
variable "Peering_vnet_name_Vnet_name2" {
  default = []
}
variable "subnet_name" {
  default = []
}
variable "sub_RG_NAME" {
  default = []
}
variable "subnet_Vnet_name" {
  default = []
}
variable "subnet_address_prefixes" {
  default = []
}
variable "key_vault_name" {
  default = []
}
variable "key_Vault_RG_NAME" {
  default = []
}
variable "key_Vault_RG_Location" {
  default = []
}
variable "key_vault_sku_name" {
  default = []
}
variable "key_vault_tags" {
  default = []
}
variable "azurerm_route_table_name" {
  default = []
}
variable "azurerm_route_table_RG_NAME" {
  default = []
}
variable "azurerm_route_table_RG_Location" {
  default = []
}
variable "route_table_tags" {
  default = []
}
variable "Route_Table_route_name" {
  default = []
}
variable "route_table_prefix_address" {
  default = []
}
variable "NSG_security_rule_name" {
  default = []
}
variable "NSG_security_rule_RG_NAME" {
  default = []
}
variable "NSG_security_rule_RG_Location" {
  default = []
}
variable "NSG_security_rule_tags" {
  default = []
}
variable "Asso_NSG_subnet_name" {
  default = []
}
variable "Asso_network_security_group_name" {
  default = []
}
variable "private_dns_zone_name" {
  default = []
}
variable "private_dns_zone_RG_NAME" {
  default = []
}
variable "PublicIP_name" {
  default = []
}
variable "PublicIP_location" {
  default = []
}
variable "PublicIP_RG_NAME" {
  default = []
}
variable "Public_IP_SKU" {
  default = []
}
variable "PublicIP_allocation_method" {
  default = []
}
variable "Load_blancer_name" {
  default = []
}
variable "Load_blancer_location" {
  default = []
}
variable "Load_blancer_RG_NAME" {
  default = []
}
variable "frontend_ip_configuration_name" {
  default = []
}
variable "Asso_LB_PublicIP_name" {
  default = []
}
variable "network_interface_name" {
  default = []
}
variable "network_interface_location" {
  default = []
}
variable "network_interface_rg_name" {
  default = []
}
variable "Asso_nic_subnet_name" {
  default = []
}
variable "private_ip_address_allocation" {
  default = []
}
variable "VM_Name" {
  default = []
}
variable "VM_RG_NAME" {
  default = []
}
variable "VM_RG_Location" {
  default = []
}
variable "Network_Interface_ID" {
  default = []
}
variable "vm_size" {
  default = []
}
variable "VM_tags" {
  default = []
}
variable "Image_publisher" {
  default = []
}
variable "Image_offer" {
  default = []
}
variable "Image_sku" {
  default = []
}
variable "VM_Zone" {
  default = []
}
variable "Image_version" {
  default = []
}
variable "os_Disk_name" {
  default = []
}
variable "os_Disk_caching" {
  default = []
}
variable "os_Disk_create_option" {
  default = []
}
variable "os_Disk_managed_disk_type" {
  default = []
}
variable "os_disk_size_gb" {
  default = []
}
variable "data_Disk_name" {
  default = []
}
variable "data_Disk_caching" {
  default = []
}
variable "data_Disk_create_option" {
  default = []
}
variable "data_Disk_managed_disk_type" {
  default = []
}
variable "data_disk_size_gb" {
  default = []
}
variable "os_profile_computer_name" {
  default = []
}
variable "os_profile_admin_username" {
  default = []
}
variable "os_profile_admin_password" {
  default = []
}
variable "disable_password_authentication" {
  default = []
}
variable "Asso_VM_network_interface_name" {
  default = []
}
variable "storage_account_name" {
  default = []
}
variable "storage_account_RG_NAME" {
  default = []
}
variable "storage_account_RG_Location" {
  default = []
}
variable "storage_account_tier" {
  default = []
}
variable "storage_account_replication_type" {
  default = []
}
variable "storage_account_tags" {
  default = []
}
variable "Network_Watcher_name" {
  default = []
}
variable "Network_Watcher_RG_NAME" {
  default = []
}
variable "Network_Watcher_location" {
  default = []
}
variable "Asso_route_subnet_name" {
  default = []
}
variable "Asso_azurerm_route_table_name" {
  default = []
}
variable "bastion_host_name" {
  default = []
}
variable "bastion_host_RG_Location" {
  default = []
}
variable "bastion_host_RG_NAME" {
  default = []
}
variable "bastion_host_ip_configuration_name" {
  default = []
}
variable "Asso_bastion_host_subnet_name" {
  default = []
}
variable "Asso_bastion_host_public_ip_name" {
  default = []
}
variable "sql_server_name" {
  default = []
}
variable "sql_server_RG_NAME" {
  default = []
}
variable "sql_server_RG_Location" {
  default = []
}
variable "sql_server_admin" {
  default = []
}
variable "sql_server_password" {
  default = []
}
variable "sql_server_tags" {
  default = []
}
variable "Log_Analytics_Workspace_name" {
  default = []
}
variable "Log_Analytics_Workspace_location" {
  default = []
}
variable "Log_Analytics_Workspace_RG_NAME" {
  default = []
}
variable "Log_Analytics_Workspace_sku" {
  default = []
}
variable "Log_Analytics_Workspace_retention_in_days" {
  default = []
}
variable "Application_Insights_name" {
  default = []
}
variable "Application_Insights_location" {
  default = []
}
variable "Application_Insights_RG_NAME" {
  default = []
}
variable "Application_Insights_application_type" {
  default = []
}
variable "Asso_Workspace_appinsights_name" {
  default = []
}
variable "subscription_budget_name" {
  default = []
}
variable "budget_track_amount" {
  default = []
}
variable "budget_time_start_date" {
  default = []
}
variable "budget_time_end_date" {
  default = []
}
variable "budget_threshold" {
  default = []
}
variable "budget_subscription_id" {
  default = []
}
variable "budget_emails" {
  default = []
}
variable "ASSO_budgent_Action_Group_name" {
  default = []
}
variable "monitor_action_group_name" {
  default = []
}
variable "monitor_action_group_RG_name" {
  default = []
}
variable "monitor_action_group_short_name" {
  default = []
}
variable "NSG_log_alert_name" {
  default = []
}
variable "NSG_log_alert_RG_name" {
  default = []
}
variable "NSG_log_alert_scopes_NSG_names" {
  default = []
}
variable "NSG_log_alert_operation" {
  default = []
}
variable "ASSO_NSG_Alert_Action_Group_name" {
  default = []
}
variable "private_endpoint_name" {
  default = []
}
variable "private_endpoint_location" {
  default = []
}
variable "private_endpoint_RG_name" {
  default = []
}
variable "private_endpoint_connection_name" {
  default = []
}
variable "ASSO_private_endpoint_subnet_name" {
  default = []
}
variable "private_endpoint_tags" {
  default = []
}
variable "ASSO_private_endpoint_key_vault_name" {
  default = []
}
variable "azurerm_firewall_name" {
  default = []
}
variable "azurerm_firewall_location" {
  default = []
}
variable "azurerm_firewall_RG_NAME" {
  default = []
}
variable "azurerm_firewall_sku_name" {
  default = []
}
variable "azurerm_firewall_sku_tier" {
  default = []
}
variable "Asso_firewall_subnet_name" {
  default = []
}
variable "Asso_firewall_public_ip_name" {
  default = []
}
variable "vault_name" {
  default = []
}
variable "vault_location" {
  default = []
}
variable "vault_resource_group_name" {
  default = []
}
variable "vault_sku" {
  default = []
}
variable "soft_delete_enabled" {
  default = []
}
variable "public_network_access_enabled" {
  default = []
}
variable "vault_tags" {
  default = []
}
variable "resource_group_name" {
  default = []
}
variable "storage_location" {
  default = []
}
variable "account_tier" {
  default = []
}
variable "account_replication_type" {
  default = []
}
variable "storage_share_name" {
  default = []
}
variable "storage_share_quota" {
  default = []
}
variable "Asso_private_endpoint_keyvault_name" {
  default = []
}
variable "TF_Pipeline_Stroage_AC_Name" {
  default = []
}
variable "TF_Pipeline_Container_name" {
  default = []
}
  
variable "TF_Pipeline_RG" {
  default = []
}

variable "private_dns_zone_link_name" {
  default = []
}
  
variable "private_dns_zone_link_RG_NAME" {
  default = []
}

variable "ASSO_vnet_private_dns_zone_name" {
  default = []
}
variable "ASSO_private_dns_zone_vnet_name" {
  default = []
}
variable "MS_target_rs_stroage_ac_name" {
  default = []
}