resource "azurerm_postgresql_flexible_server" "postgredb" {
  for_each               = var.postgresdb
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  location               = each.value.location
  administrator_login    = each.value.administrator_login
  administrator_password = each.value.administrator_password
  storage_mb             = each.value.storage_mb
  version                = each.value.version
  sku_name               = each.value.sku_name
  zone                   = each.value.zone
}



