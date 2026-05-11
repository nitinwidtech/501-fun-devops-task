output "servicebus_namespace_id" {
  value = azurerm_servicebus_namespace.main.id
}

output "servicebus_queue_name" {
  value = azurerm_servicebus_queue.device_events.name
}