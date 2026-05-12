resource "azurerm_resource_group" "foo" {
  name     = "foo-rg"
  location = "East US"
}

resource "azurerm_container_registry" "foo" {
  name                = "fooregistry"
  resource_group_name = azurerm_resource_group.foo.name
  location            = azurerm_resource_group.foo.location
  sku                 = "Basic"
}
