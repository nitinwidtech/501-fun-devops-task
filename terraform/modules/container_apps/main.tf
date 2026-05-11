data "azurerm_client_config" "current" {}

resource "azurerm_container_app_environment" "main" {
  name                       = var.container_app_env_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

resource "azurerm_container_app" "main" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.main.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  identity {
    type = "SystemAssigned"
  }

  # registry {
  #   server   = var.acr_login_server
  #   identity = "System"
  # }

  template {
    container {
      name   = "central-config"
      image  = "nginx:latest"
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 80

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}

# resource "azurerm_role_assignment" "acr_pull" {
#   scope                = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.ContainerRegistry/registries/${replace(var.acr_login_server, ".azurecr.io", "")}"
#   role_definition_name = "AcrPull"
#   principal_id         = azurerm_container_app.main.identity[0].principal_id
# }