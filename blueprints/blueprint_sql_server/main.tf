
resource "random_string" "administrator_login" {
  length  = 12
}

resource "random_password" "administrator_login_password" {
  length  = 32
  special = true
}

resource "random_integer" "random" {
  min = 100
  max = 999
}

resource "azurerm_sql_server" "sqlserver" {
  # Naming convention sqldb-<App Name>-<Environment>
  name                         = "sql-${var.app_name}-${var.env}-${random_integer.random.result}"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = "12.0"
  administrator_login          = random_string.administrator_login.result
  administrator_login_password = random_password.administrator_login_password.result
  tags                         = var.tags
}


resource "azurerm_sql_database" "sql_database" {
  for_each = var.databases
  
  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sqlserver.name
  collation           = each.value.collation
  edition             = each.value.edition
  tags                = var.tags
}


# Allow access from Azure services 
resource "azurerm_sql_firewall_rule" "rule" {
  name                = "AllowInternalAzureService"
  resource_group_name = azurerm_sql_server.sqlserver.resource_group_name
  server_name         = azurerm_sql_server.sqlserver.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
