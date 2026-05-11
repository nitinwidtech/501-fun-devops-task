output "log_analytics_id" {
  value = azurerm_log_analytics_workspace.main.id
}

output "workspace_id" {
  value = azurerm_log_analytics_workspace.main.workspace_id
}

output "app_insights_key" {
  value = azurerm_application_insights.main.instrumentation_key
}