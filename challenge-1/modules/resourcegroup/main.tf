resource "azurerm_resource_group" "azure-rg" {
  name     = var.name
  location = var.location
}
