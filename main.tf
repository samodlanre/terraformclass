resource "azurerm_resource_group" "rg" {
  name     = "class-rg"
  location = "East US"
}

resource "azurerm_storage_account" "mystorage" {
  name                     = "thisismystorage23456"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

# resource "azurerm_kubernetes_cluster" "myaks" {
#   name                = "myakscluster"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   dns_prefix          = "exampleaks1"

#   default_node_pool {
#     name       = "default"
#     node_count = 1
#     vm_size    = "standard_dc2s_v3"
#   }
#   identity {
#     type = "SystemAssigned"
#   }

#   tags = {
#     Environment = "DEV"
#   }
# }
