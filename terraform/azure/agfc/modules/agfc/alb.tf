resource "azurerm_application_load_balancer" "this" {
  name                = local.service_name
  location            = data.azurerm_resource_group.core.location
  resource_group_name = data.azurerm_resource_group.core.name
}
 
resource "azurerm_application_load_balancer_subnet_association" "this" {
  name                         = local.service_name
  application_load_balancer_id = azurerm_application_load_balancer.this.id
  subnet_id                    = azurerm_subnet.appgw_subnet.id
}
 
resource "azurerm_application_load_balancer_frontend" "this" {
  name                         = local.service_name
  application_load_balancer_id = azurerm_application_load_balancer.this.id
}