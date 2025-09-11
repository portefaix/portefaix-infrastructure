resource "azurerm_log_analytics_workspace" "this" {
  count = var.deploy_observability_tools ? 1 : 0

  name                = local.service_name
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location
  sku                 = var.sku_observability
  retention_in_days   = var.log_analytics_retention_in_days

  tags = var.tags
}

resource "azurerm_monitor_workspace" "this" {
  count = var.deploy_observability_tools ? 1 : 0

  name                = local.service_name
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location

  tags = var.tags
}
