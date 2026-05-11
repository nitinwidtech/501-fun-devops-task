resource "azurerm_servicebus_namespace" "main" {
  name                = var.servicebus_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  local_auth_enabled            = false
  public_network_access_enabled = false
}

resource "azurerm_servicebus_queue" "device_events" {
  name         = "device-events"
  namespace_id = azurerm_servicebus_namespace.main.id

  partitioning_enabled = true
}