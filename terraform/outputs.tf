output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "acr_login_server" {
  value = module.acr.login_server
}

output "keyvault_uri" {
  value = module.keyvault.vault_uri
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "log_analytics_workspace_id" {
  value = module.monitoring.workspace_id
}

output "api_gateway_url" {
  value = module.api_management.gateway_url
}

output "central_config_url" {
  value = module.container_apps.container_app_url
}

output "servicebus_queue_name" {
  value = module.service_bus.servicebus_queue_name
}

output "eventhub_name" {
  value = module.eventhub.eventhub_name
}

output "communication_service_id" {
  value = module.communication.communication_service_id
}

output "raw_videos_container" {
  value = module.video_processing.raw_videos_container
}

output "processed_videos_container" {
  value = module.video_processing.processed_videos_container
}

output "video_jobs_queue" {
  value = module.video_processing.video_jobs_queue
}