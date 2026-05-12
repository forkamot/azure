resource "azurerm_virtual_network" "foo" {
  name                = "foo-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.foo.location
  resource_group_name = azurerm_resource_group.foo.name
}

resource "azurerm_subnet" "foo" {
  name                 = "foo-subnet"
  resource_group_name  = azurerm_resource_group.foo.name
  virtual_network_name = azurerm_virtual_network.foo.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "foo" {
  name                = "foo-nic"
  location            = azurerm_resource_group.foo.location
  resource_group_name = azurerm_resource_group.foo.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.foo.id
    private_ip_address_allocation = "Dynamic"
  }
}
