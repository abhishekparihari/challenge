provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source   = "./modules/resourcegroup"
  name     = var.name
  location = var.location
}

module "networking" {
  source         = "./modules/networking"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetcidr       = var.vnetcidr
  websubnetcidr  = var.websubnetcidr
  appsubnetcidr  = var.appsubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
}

module "compute" {
  source         = "./modules/compute"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  web_subnet_id  = module.networking.websubnet_id
  app_subnet_id  = module.networking.appsubnet_id
}

module "database" {
  source                = "./modules/database"
  location              = module.resourcegroup.location_id
  resource_group        = module.resourcegroup.resource_group_name
  mssql_server_version  = var.mssql_server_version
  mssql_server_admin    = var.mssql_server_admin
  mssql_server_password = var.mssql_server_password
}
