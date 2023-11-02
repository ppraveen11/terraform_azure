module "Network_Resource_Group" {
  source       = "../../common_module/Resource_Group"
  RG_NAME      = var.RG_NAME
  RG_Location  = var.RG_Location
  RG_tags      = var.RG_tags
}

module "Vnet" {
  source             = "../../common_module/Vnet"
  Vnet_RG_NAME       = var.Vnet_RG_NAME
  Vnet_RG_Location   = var.Vnet_RG_Location
  address_space      = var.Vnet_address_space
  # dns_servers     = var.dns_servers
  Vnet_name          = var.Vnet_name
  Vnet_tags          = var.Vnet_tags
  depends_on         = [module.Network_Resource_Group]
}

module "vent_peering" {
  source                          = "../../common_module/Peering"
  Peering_vnet_name               = var.Peering_vnet_name
  Peering_vnet_name_RG_NAME       = var.Peering_vnet_name_RG_NAME
  Peering_vnet_name_Vnet_name     = var.Peering_vnet_name_Vnet_name
  Peering_vnet_name2              = var.Peering_vnet_name2
  Peering_vnet_name_Vnet_name2    = var.Peering_vnet_name_Vnet_name2
  peer_virtual_network_id1 = [for idx, vnet_name in var.Peering_vnet_name_Vnet_name2 :
  module.Vnet.Vnet_IDs[vnet_name] ]
   peer_virtual_network_id2 = [for idx, vnet_name in var.Peering_vnet_name_Vnet_name :
  module.Vnet.Vnet_IDs[vnet_name] ]
  depends_on = [module.Network_Resource_Group, module.Vnet]
}


module "subnet" {
    source = "../../common_module/Subnet"
    subnet_name = var.subnet_name
    sub_RG_NAME = var.sub_RG_NAME
    subnet_Vnet_name = var.subnet_Vnet_name
    subnet_address_prefixes= var.subnet_address_prefixes
    depends_on = [ module.Vnet, module.Network_Resource_Group ]

    }

module "key_vault" {
  source = "../../common_module/Key_Vault"
  key_vault_name = var.key_vault_name 
  key_Vault_RG_NAME = var.key_Vault_RG_NAME
  key_Vault_RG_Location = var.key_Vault_RG_Location
  key_vault_sku_name = var.key_vault_sku_name
  key_vault_tags= var.key_vault_tags
  depends_on = [ module.Network_Resource_Group ]
}

module "route_moduel" {

  source = "../../common_module/Route_table"
  azurerm_route_table_name = var.azurerm_route_table_name
  azurerm_route_table_RG_NAME = var.azurerm_route_table_RG_NAME
  azurerm_route_table_RG_Location = var.azurerm_route_table_RG_Location
  route_table_tags = var.route_table_tags
  Route_Table_route_name= var.Route_Table_route_name
  route_table_prefix_address = var.route_table_prefix_address
  depends_on = [ module.Network_Resource_Group, module.subnet]
}

module "network_security_group" {
  source = "../../common_module/Network_security_group"
  NSG_security_rule_name = var.NSG_security_rule_name
  NSG_security_rule_RG_NAME = var.NSG_security_rule_RG_NAME
  NSG_security_rule_RG_Location = var.NSG_security_rule_RG_Location
  NSG_security_rule_tags = var.NSG_security_rule_tags
  depends_on = [module.Network_Resource_Group]
}

module "Associationsubnet_network_security_group" {
  
  source = "../../common_module/Association_subnet_network_security_group"
  Asso_subnet_name = [for idx, subnet_name in var.Asso_NSG_subnet_name : module.subnet.subnet_IDs[subnet_name]]
  Asso_network_security_group_name =  [for idx, NSG_security_rule_name in var.Asso_network_security_group_name : 
  module.network_security_group.NSG_IDs[NSG_security_rule_name]]
  depends_on = [ module.Network_Resource_Group, module.subnet, module.network_security_group]

}


module "private_dns_zone" {
  source = "../../common_module/Private_DNS_Zone"
  private_dns_zone_name = var.private_dns_zone_name
  private_dns_zone_RG_NAME = var.private_dns_zone_RG_NAME
  depends_on = [module.Network_Resource_Group]
}



module "public_ip" {
  # count = var.PublicIP_name != null ? 1 : 0

  source = "../../common_module/Public_IP"
  PublicIP_name = var.PublicIP_name
  PublicIP_location = var.PublicIP_location
  PublicIP_RG_NAME = var.PublicIP_RG_NAME
  Public_IP_SKU = var.Public_IP_SKU
  PublicIP_allocation_method = var.PublicIP_allocation_method
  depends_on = [module.Network_Resource_Group]
}

module "load_blancer" {
  # for_each  = var.Load_blancer_name != null && var.PublicIP_name != null ? { key = "value" } : {}
  source = "../../common_module/Load_blancer"
  Load_blancer_name = var.Load_blancer_name
  Load_blancer_location = var.Load_blancer_location
  Load_blancer_RG_NAME = var.Load_blancer_RG_NAME
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  LB_public_ip_address_id =   [for idx, PublicIP_name in var.Asso_LB_PublicIP_name : 
  module.public_ip.public_ip_IDs[PublicIP_name]] 
  depends_on = [ module.public_ip,module.Network_Resource_Group ]

}

module "network_interface" {
    # count       = var.network_interface_name  != null ? 1 : 0
    source = "../../common_module/NIC'S"
    network_interface_name = var.network_interface_name
    network_interface_location = var.network_interface_location
    network_interface_rg_name = var.network_interface_rg_name
    nic_subnet_id = [for idx, subnet_name in var.Asso_nic_subnet_name : module.subnet.subnet_IDs[subnet_name]]
    # private_ip_address_allocation = var.private_ip_address_allocation
}


module "Virtual_Machine" {
    count       = var.VM_Name != null ? 1 : 0
    source = "../../common_module/VM"
    VM_RG_NAME= var.VM_RG_NAME
    VM_RG_Location = var.VM_RG_Location
    # network_interface_ids= var.Network_Interface_ID
    VM_Name=var.VM_Name
    vm_size=var.vm_size
    VM_tags=var.VM_tags
    Image_publisher=var.Image_publisher
    Image_offer=var.Image_offer
    Image_sku=var.Image_sku
    VM_Zone=var.VM_Zone
    Image_version=var.Image_version
    os_Disk_name=var.os_Disk_name
    os_Disk_caching=var.os_Disk_caching
    os_Disk_create_option=var.os_Disk_create_option
    os_Disk_managed_disk_type=var.os_Disk_managed_disk_type
    os_disk_size_gb=var.os_disk_size_gb
    data_Disk_name=var.data_Disk_name
    data_Disk_caching=var.data_Disk_caching
    data_Disk_create_option=var.data_Disk_create_option
    data_Disk_managed_disk_type=var.data_Disk_managed_disk_type
    data_disk_size_gb=var.data_disk_size_gb
    os_profile_computer_name=var.os_profile_computer_name
    os_profile_admin_username=var.os_profile_admin_username
    os_profile_admin_password=var.os_profile_admin_password
    disable_password_authentication=var.disable_password_authentication

    network_interface_id = [for idx, network_interface_names in var.Asso_VM_network_interface_name :
    module.network_interface.network_interface_IDs[network_interface_names]]
    depends_on = [ module.Vnet, module.subnet, module.Network_Resource_Group, module.network_interface ]
}



module "storage_account" {
  source = "../../common_module/Storage_Account"
  storage_account_name = var.storage_account_name
  storage_account_RG_NAME = var.storage_account_RG_NAME
  storage_account_RG_Location = var.storage_account_RG_Location
  storage_account_tier = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  storage_account_tags = var.storage_account_tags
  depends_on = [module.Network_Resource_Group]
}

module "network_watcher" {
  source = "../../common_module/network_watcher"
  Network_Watcher_name= var.Network_Watcher_name
  Network_Watcher_RG_NAME= var.Network_Watcher_RG_NAME
  Network_Watcher_location = var.Network_Watcher_location
  depends_on = [ module.Network_Resource_Group ]

}


module "Association_subnet_route_table" {
  source = "../../common_module/Association_subnet_route_table"
  Asso_subnet_name = [for idx, subnet_name in var.Asso_route_subnet_name : module.subnet.subnet_IDs[subnet_name]]
  Asso_azurerm_route_table_name =  [for idx, azurerm_route_table_name in var.Asso_azurerm_route_table_name : 
  module.route_moduel.route_tabel_IDs[azurerm_route_table_name]]
  depends_on = [ module.Network_Resource_Group, module.subnet, module.route_moduel]

}

module "bastion_host" {
  source = "../../common_module/bastion_host"
  bastion_host_name = var.bastion_host_name
  bastion_host_RG_Location = var.bastion_host_RG_Location
  bastion_host_RG_NAME = var.bastion_host_RG_NAME
  bastion_host_ip_configuration_name = var.bastion_host_ip_configuration_name
  bastion_host_subnet_id = [for idx, subnet_name in var.Asso_bastion_host_subnet_name : module.subnet.subnet_IDs[subnet_name]]
  bastion_host_public_ip_id = [for idx, PublicIP_name in var.Asso_bastion_host_public_ip_name : 
  module.public_ip.public_ip_IDs[PublicIP_name]]
  depends_on = [ module.subnet, module.public_ip, module.Network_Resource_Group ] 
}

module "sql_server" {
  source = "../../common_module/sql_server"
  sql_server_name = var.sql_server_name
  sql_server_RG_NAME = var.sql_server_RG_NAME
  sql_server_RG_Location = var.sql_server_RG_Location
  sql_server_admin = var.sql_server_admin
  sql_server_password = var.sql_server_password
  sql_server_tags = var.sql_server_tags
  depends_on = [ module.Network_Resource_Group ]
}

module "Log_Analytics_Workspace" {
  source = "../../common_module/Log_Analytics_Workspace"
  Log_Analytics_Workspace_name = var.Log_Analytics_Workspace_name
  Log_Analytics_Workspace_location = var.Log_Analytics_Workspace_location
  Log_Analytics_Workspace_RG_NAME = var.Log_Analytics_Workspace_RG_NAME
  Log_Analytics_Workspace_sku = var.Log_Analytics_Workspace_sku
  # Log_Analytics_Workspace_retention_in_days = var.Log_Analytics_Workspace_retention_in_days
  depends_on = [ module.Network_Resource_Group ]
}

module "Application_insights" {
 source = "../../common_module/Application_Insights"
 Application_Insights_name= var.Application_Insights_name
 Application_Insights_location = var.Application_Insights_location
 Application_Insights_RG_NAME = var.Application_Insights_RG_NAME
 Application_Insights_application_type = var.Application_Insights_application_type
 workspace_id        = [for idx, Log_Analytics_Workspace_name in var.Asso_Workspace_appinsights_name :  
 module.Log_Analytics_Workspace.Log_Analytics_Workspace_ID[Log_Analytics_Workspace_name]]
 depends_on = [ module.Network_Resource_Group ]
}



module "budget" {
  source = "../../common_module/Budgets_sub"
 subscription_budget_name= var.subscription_budget_name
  budget_track_amount = var.budget_track_amount
  budget_time_start_date = var.budget_time_start_date
  budget_time_end_date = var.budget_time_end_date
  budget_threshold = var.budget_threshold
  budget_subscription_id = var.budget_subscription_id
  # budget_emails = var.budget_emails
  ASSO_budgent_Action_Group_name = [for idx, monitor_action_group_name in var.ASSO_budgent_Action_Group_name : module.monitor_action_group.monitor_action_group_IDs[monitor_action_group_name]]

  depends_on = [module.Network_Resource_Group, module.monitor_action_group]

}

module "monitor_action_group" {
  source = "../../common_module/Monitor_Action_Group"
  monitor_action_group_name = var.monitor_action_group_name
  monitor_action_group_RG_name = var.monitor_action_group_RG_name
  monitor_action_group_short_name = var.monitor_action_group_short_name
  depends_on = [module.Network_Resource_Group]
}

module "Alert_log" {
  source = "../../common_module/Alert_NSG_delete"
  NSG_log_alert_name = var.NSG_log_alert_name
  NSG_log_alert_RG_name= var.NSG_log_alert_RG_name
  NSG_log_alert_scopes_NSG_names = [for idx, NSG in var.NSG_log_alert_scopes_NSG_names : module.network_security_group.NSG_IDs[NSG]]
  NSG_log_alert_operation = var.NSG_log_alert_operation
  ASSO_NSG_Alert_Action_Group_name = [for idx, monitor_action_group_name in var.ASSO_NSG_Alert_Action_Group_name : module.monitor_action_group.monitor_action_group_IDs[monitor_action_group_name]]
  depends_on = [module.Network_Resource_Group,module.network_security_group, module.monitor_action_group]
}

module "private_end_point" {
  source = "../../common_module/private_end_point"
  private_endpoint_name = var.private_endpoint_name
  private_endpoint_location = var.private_endpoint_location
  private_endpoint_RG_name = var.private_endpoint_RG_name
  private_endpoint_connection_name = var.private_endpoint_connection_name
  private_endpoint_subnet_id = [for idx, subnet_name in var.ASSO_private_endpoint_subnet_name : module.subnet.subnet_IDs[subnet_name]]
  private_endpoint_tags = var.private_endpoint_tags
  private_endpoint_connection_resource_id = [for idx, key_vault in var.ASSO_private_endpoint_key_vault_name  : module.key_vault.key_vault_ids[key_vault]]
  depends_on = [module.Network_Resource_Group, module.subnet]
}

module "azurerm_firewall" {
  source = "../../common_module/firewall_public_ip"
  azurerm_firewall_name = var.azurerm_firewall_name
  azurerm_firewall_location = var.azurerm_firewall_location
  azurerm_firewall_RG_NAME = var.azurerm_firewall_RG_NAME
  azurerm_firewall_sku_name = var.azurerm_firewall_sku_name
  azurerm_firewall_sku_tier = var.azurerm_firewall_sku_tier
  azurerm_firewall_subnet_id = [for idx, subnet_name in var.Asso_firewall_subnet_name : module.subnet.subnet_IDs[subnet_name]]
  azurerm_firewall_public_ip_address_id = [for idx, PublicIP_name in var.Asso_firewall_public_ip_name : module.public_ip.public_ip_IDs[PublicIP_name]]
  depends_on = [module.Network_Resource_Group, module.subnet, module.public_ip]
  
}

module "private_dns_zone_link_vnet" {
  source = "../../common_module/private_dns_zone_virtual_network_link"
  private_dns_zone_link_name = var.private_dns_zone_link_name
  private_dns_zone_link_RG_NAME = var.private_dns_zone_link_RG_NAME
  ASSO_vnet_private_dns_zone_name = var.ASSO_vnet_private_dns_zone_name
  private_dns_zone_link_virtual_network_id = [for idx, vnet_name in var.ASSO_private_dns_zone_vnet_name : module.Vnet.Vnet_IDs[vnet_name]]
  depends_on = [ module.Network_Resource_Group, module.Vnet, module.private_dns_zone]
}




module "MS_defender" {
  source = "../../common_module/MS_DEFENDER_FOR_CLOUD"
  MS_target_resource_id = [for idx , stroage_account in var.MS_target_rs_stroage_ac_name : module.storage_account.storage_account_IDs[stroage_account]]
  depends_on = [ module.storage_account ]
}
















  





  

  


  
