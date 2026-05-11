resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  aks_subnet          = var.aks_subnet
  app_subnet          = var.app_subnet
  data_subnet         = var.data_subnet
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  acr_name            = var.acr_name
}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  log_analytics_name  = var.log_analytics_name
}

module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  keyvault_name       = var.keyvault_name
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = azurerm_resource_group.main.name
  location             = var.location
  storage_account_name = var.storage_account_name
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  cluster_name        = var.aks_cluster_name
  subnet_id           = module.networking.aks_subnet_id
  log_analytics_id    = module.monitoring.log_analytics_id
  acr_id              = module.acr.acr_id
}

module "api_management" {
  source              = "./modules/api_management"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  apim_name           = var.apim_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
}

module "container_apps" {
  source                     = "./modules/container_apps"
  resource_group_name        = azurerm_resource_group.main.name
  location                   = var.location
  container_app_env_name     = var.container_app_env_name
  container_app_name         = var.container_app_name
  acr_login_server           = module.acr.login_server
  log_analytics_workspace_id = module.monitoring.log_analytics_id
}

module "service_bus" {
  source                    = "./modules/service_bus"
  resource_group_name       = azurerm_resource_group.main.name
  location                  = var.location
  servicebus_namespace_name = var.servicebus_namespace_name
}

module "eventhub" {
  source                  = "./modules/eventhub"
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  eventhub_namespace_name = var.eventhub_namespace_name
  eventhub_name           = var.eventhub_name
}

module "communication" {
  source                     = "./modules/communication"
  resource_group_name        = azurerm_resource_group.main.name
  location                   = var.location
  communication_service_name = var.communication_service_name
}

module "video_processing" {
  source               = "./modules/video_processing"
  resource_group_name  = azurerm_resource_group.main.name
  location             = var.location
  storage_account_name = module.storage.storage_account_name
}