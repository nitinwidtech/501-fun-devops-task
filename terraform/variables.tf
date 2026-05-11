variable "location" {
  description = "Azure region"
  default     = "UK South"
}

variable "resource_group_name" {
  description = "Main resource group"
  default     = "rg-501fun-prod"
}

variable "vnet_name" {
  default = "vnet-501fun-prod"
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "aks_subnet" {
  default = ["10.0.1.0/24"]
}

variable "app_subnet" {
  default = ["10.0.2.0/24"]
}

variable "data_subnet" {
  default = ["10.0.3.0/24"]
}

variable "aks_cluster_name" {
  default = "aks-501fun-prod"
}

variable "acr_name" {
  default = "acr501funprod"
}

variable "keyvault_name" {
  default = "kv-501fun-prod"
}

variable "storage_account_name" {
  default = "st501funprod"
}

variable "log_analytics_name" {
  default = "log-501fun-prod"
}

variable "apim_name" {
  default = "apim-501fun-prod"
}

variable "publisher_name" {
  default = "501 Entertainment"
}

variable "publisher_email" {
  default = "devops@501fun.com"
}

variable "container_app_env_name" {
  default = "cae-501fun-prod"
}

variable "container_app_name" {
  default = "ca-central-config"
}

variable "servicebus_namespace_name" {
  default = "sb-501fun-prod"
}

variable "eventhub_namespace_name" {
  default = "evhns-501fun-prod"
}

variable "eventhub_name" {
  default = "venue-logs"
}

variable "communication_service_name" {
  default = "acs-501fun-prod"
}