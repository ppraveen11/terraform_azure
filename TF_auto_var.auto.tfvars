TF_Pipeline_RG = ["pipeline_test-rg"]
TF_Pipeline_Stroage_AC_Name = ["pipelinestoraccount"]
TF_Pipeline_Container_name = ["vhds"]
RG_NAME = ["rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-02"]
RG_Location = ["qatarcentral", "qatarcentral"]
RG_tags = [{"Environment": "Development", "Workstream": "Local"}, {"Environment": "Development", "Workstream": "Local"}]
Vnet_name = ["vnet-cpd-pltf-dev-we-01", "vnet-cpd-pltf-dev-we-02", "vnet-cpd-pltf-dev-we-03", "vnet-cpd-pltf-dev-we-04"]
Vnet_RG_Location = ["qatarcentral", "qatarcentral", "qatarcentral", "qatarcentral"]
Vnet_RG_NAME = ["rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01"]
Vnet_address_space = ["10.0.1.0/24", "172.27.228.0/25", "10.0.3.0/24", "10.0.4.0/24"]
dns_servers = ["[10.0.0.4,10.0.0.5]", "[10.0.0.4,10.0.0.5]", "[10.0.0.4,10.0.0.5]", "[10.0.0.4,10.0.0.5]"]
Vnet_tags = [{"Environment": "Development", "Workstream": "Local"}, {"Environment": "Development", "Workstream": "Local"}, {"Environment": "Development", "Workstream": "Local"}, {"Environment": "Development", "Workstream": "Local"}]
subnet_name = ["snet-cpd-pltf-aks-dev-we-01", "AzureBastionSubnet", "snet-cpd-pltf-aks-dev-we-02"]
subnet_address_prefixes = ["172.27.228.0/27", "172.27.228.32/28", "172.27.228.48/28"]
sub_RG_NAME = ["rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01"]
subnet_Vnet_name = ["vnet-cpd-pltf-dev-we-02", "vnet-cpd-pltf-dev-we-02", "vnet-cpd-pltf-dev-we-02"]
VM_Name = ["blqavmprdwe01", "blqavmprdwe02"]
vm_size = ["Standard_D2s_v3", "Standard_D2s_v3"]
Image_publisher = ["MicrosoftWindowsServer", "MicrosoftWindowsServer"]
Image_offer = ["WindowsServer", "WindowsServer"]
VM_Zone = ["1", "1"]
Image_sku = ["2019-Datacenter", "2019-Datacenter"]
Image_version = ["latest", "latest"]
data_Disk_name = ["blqavmprdwe01_DataDisk_0", "blqavmprdwe02_DataDisk_0"]
data_Disk_caching = ["ReadWrite", "ReadWrite"]
data_Disk_create_option = ["Empty", "Empty"]
os_Disk_name = ["blqavmprdwe01_OSDisk_1", "blqavmprdwe02_OSDisk_1"]
os_Disk_caching = ["ReadWrite", "ReadWrite"]
os_Disk_create_option = ["FromImage", "FromImage"]
os_disk_size_gb = ["127", "127"]
os_Disk_managed_disk_type = ["Premium_LRS", "Premium_LRS"]
data_Disk_managed_disk_type = ["Premium_LRS", "Premium_LRS"]
os_profile_computer_name = ["blqavmprdwe01", "blqavmprdwe02"]
os_profile_admin_username = ["host_admin", "host_admin"]
os_profile_admin_password = ["admin*123", "admin*123"]
data_disk_size_gb = ["64", "64"]
disable_password_authentication = ["False", "False"]
VM_RG_NAME = ["rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01"]
VM_RG_Location = ["qatarcentral", "qatarcentral"]
VM_tags = [{"Environment": "Development", "Workstream": "Local"}, {"Environment": "Development", "Workstream": "Local"}]
Asso_VM_network_interface_name = ["blda1qavmprdwe01-nic", "blqavmprdwe02-nic"]
Asso_azurerm_route_table_name = ["route-cpd-app-dev-we-01", "route-cpd-app-dev-we-02"]
Asso_route_subnet_name = ["snet-cpd-pltf-aks-dev-we-01", "snet-cpd-pltf-aks-dev-we-02"]
network_interface_name = ["blqavmprdwe01-nic", "blqavmprdwe02-nic"]
network_interface_location = ["qatarcentral", "qatarcentral"]
network_interface_rg_name = ["rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01"]
Asso_nic_subnet_name = ["snet-cpd-pltf-aks-dev-we-01", "snet-cpd-pltf-aks-dev-we-02"]
NSG_security_rule_name = ["nsg-cpd-app-dev-we-01", "nsg-cpd-app-dev-we-02"]
NSG_security_rule_RG_NAME = ["rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01"]
NSG_security_rule_RG_Location = ["qatarcentral", "qatarcentral"]
NSG_security_rule_tags = [{"Environment": "Development", "Workstream": "Local"}, {"Environment": "Development", "Workstream": "Local"}]
Asso_network_security_group_name = ["nsg-cpd-app-dev-we-01", "nsg-cpd-app-dev-we-02"]
Asso_NSG_subnet_name = ["snet-cpd-pltf-aks-dev-we-01", "snet-cpd-pltf-aks-dev-we-02"]
Peering_vnet_name = ["peer-cpd-pltf-dev-we-01-to-cph-pltf-prd-we-01", "peer-cpd-pltf-dev-we-01-to-cph-pltf-prd-we-03"]
Peering_vnet_name_RG_NAME = ["rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01"]

Peering_vnet_name_Vnet_name = ["vnet-cpd-pltf-dev-we-01", "vnet-cpd-pltf-dev-we-03"]
Peering_vnet_name_Vnet_name2 = ["vnet-cpd-pltf-dev-we-02", "vnet-cpd-pltf-dev-we-04"]
Peering_vnet_name2 = ["peer-cpd-pltf-dev-we-01-to-cph-pltf-prd-we-02", "peer-cpd-pltf-dev-we-01-to-cph-pltf-prd-we-04"]
azurerm_route_table_name = ["route-cpd-app-dev-we-01", "route-cpd-app-dev-we-02"]
Route_Table_route_name = ["route-mal-prod-01", "route-xyz-prd-02"]
route_table_tags = [{"Environment": "Development", "Workstream": "GIS"}, {"Environment": "Development", "Workstream": "GIS"}]
azurerm_route_table_RG_NAME = ["rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01"]
azurerm_route_table_RG_Location = ["qatarcentral", "qatarcentral"]
route_table_prefix_address = ["10.1.0.0/16", "10.1.0.0/16"]
key_vault_name = ["kv-cpd-apps-dev-we-01", "kv-cpd-apps-dev-we-02", "kv-cpd-apps-dev-we-03"]
key_Vault_RG_NAME = ["rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-01", "rg-cpd-app-dev-we-02"]
key_vault_tags = [{"Environment": "Development", "Workstream": "Local"}, {"Environment": "Development", "Workstream": "Local"}, {"Environment": "Development", "Workstream": "Local"}]
key_Vault_RG_Location = ["qatarcentral", "qatarcentral", "qatarcentral"]
key_vault_sku_name = ["standard", "standard", "standard"]
Log_Analytics_Workspace_name  = ["log-cpd-dev-we-01", "log-cpd-dev-we-02"]
Log_Analytics_Workspace_RG_NAME = ["rg-cpd-app-dev-we-02", "rg-cpd-app-dev-we-02"]
Log_Analytics_Workspace_location = ["qatarcentral", "qatarcentral"]
Log_Analytics_Workspace_sku = ["Basic", "Basic"]
Application_Insights_name = ["appi-cpd-apps-mon-dev-we-01"]
Application_Insights_application_type = ["web"]
Application_Insights_RG_NAME = ["rg-cpd-app-dev-we-02"]
Application_Insights_location = ["qatarcentral"]
Asso_Workspace_appinsights_name  = ["log-cpd-dev-we-01"]
Asso_LB_PublicIP_name = ["PublicIPForLBsec"]
Load_blancer_RG_NAME = ["rg-cpd-app-dev-we-02"]
Load_blancer_location = ["qatarcentral"]
Load_blancer_name = ["lbi-cpp-bpm-web-prd-we-01"]
frontend_ip_configuration_name = ["PublicIPAddress"]
PublicIP_name = ["PublicIPForBasttion", "PublicIPForLBsec"]
PublicIP_location = ["qatarcentral", "qatarcentral"]
PublicIP_RG_NAME = ["rg-cpd-app-dev-we-02", "rg-cpd-app-dev-we-02"]
PublicIP_allocation_method = ["Static", "Static"]
Public_IP_SKU = ["Standard", "Standard"]
subscription_budget_name = ["budget-test"]
budget_track_amount = ["1000"]
budget_time_start_date = ["2023-10-01T00:00:00Z"]
budget_threshold = ["90"]
budget_subscription_id = ["796a3840-26cb-4792-9c39-bc989419117a"]
budget_time_end_date = ["2023-11-01T00:00:00Z"]
ASSO_budgent_Action_Group_name  = ["example-actiongroup"]
 monitor_action_group_name = ["example-actiongroup"]
monitor_action_group_RG_name = ["rg-auto-budget--test-01"]
monitor_action_group_short_name = ["actiongroup"]
storage_account_name = ["stcpdappsapimtdevwe01"]
storage_account_RG_NAME = ["rg-cpd-app-dev-we-02"]
storage_account_RG_Location = ["qatarcentral"]
storage_account_tags = [{"Environment": "Development", "Workstream": "Local"}]
storage_account_tier = ["Standard"]
storage_account_replication_type = ["LRS"]
bastion_host_name = ["sxx-wd-bas-weu-x-001"]
bastion_host_RG_NAME = ["rg-cpd-app-dev-we-02"]
bastion_host_RG_Location = ["qatarcentral"]
bastion_host_ip_configuration_name = ["configuration"]
Asso_bastion_host_subnet_name = ["AzureBastionSubnet"]
Asso_bastion_host_public_ip_name  = ["PublicIPForBasttion"]
private_dns_zone_name = ["privatelink.cognitiveservices.windows.net"]
private_dns_zone_RG_NAME = ["rg-cpd-app-dev-we-01"]
private_endpoint_name = ["extestado-endpoint"]
private_endpoint_location = ["qatarcentral"]
private_endpoint_RG_name = ["rg-mal-01"]
private_endpoint_tags = [{"Environment": "Development", "Workstream": "GIS"}]
ASSO_private_endpoint_subnet_name = ["my-mal-04"]
ASSO_private_endpoint_key_vault_name = ["kv-cpd-apps-dev-we-01"]