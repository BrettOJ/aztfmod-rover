output "server_name" {
  value = azurerm_sql_server.sqlserver.name
}

output "fully_qualified_domain_name" {
  value = azurerm_sql_server.sqlserver.fully_qualified_domain_name
}

output "administrator_login" {
  value = azurerm_sql_server.sqlserver.administrator_login
}

output "administrator_login_password" {
  value = azurerm_sql_server.sqlserver.administrator_login_password
}

output "azurerm_sql_database_names" {
  value = {
    for instance in azurerm_sql_database.sql_database:
    instance.name => instance.name
  }
}
