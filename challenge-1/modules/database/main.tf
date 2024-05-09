resource "azurerm_mssql_server" "mssql-server" {
  name                         = "mssql-server"
  resource_group_name          = var.resource_group
  location                     = var.location
  version                      = var.mssql_server_version
  administrator_login          = var.mssql_server_admin
  administrator_login_password = var.mssql_server_password
}

resource "azurerm_mssql_database" "mssql-database" {
  name      = "mssql-database"
  server_id = azurerm_mssql_server.mssql-server.id
}