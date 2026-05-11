output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "app_subnet_id" {
  value = azurerm_subnet.app.id
}

output "data_subnet_id" {
  value = azurerm_subnet.data.id
}

output "vnet_id" {
  value = azurerm_virtual_network.main.id
}