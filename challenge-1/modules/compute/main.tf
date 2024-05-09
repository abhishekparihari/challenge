resource "azurerm_network_interface" "web-network-interface" {
  name                = "web-network"
  resource_group_name = var.resource_group
  location            = var.location

  ip_configuration {
    name                          = "web-webserver"
    subnet_id                     = var.web_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "web-vm" {
  name                = "web-vm"
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "admin"
  network_interface_ids = [
    azurerm_network_interface.web-network-interface.id,
  ]

  admin_ssh_key {
    username   = "admin"
    public_key = file(".ssh/authorized_keys")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "app-network-interface" {
  name                = "app-network"
  resource_group_name = var.resource_group
  location            = var.location

  ip_configuration {
    name                          = "app-webserver"
    subnet_id                     = var.app_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "app-vm" {
  name                = "app-vm"
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "admin"
  network_interface_ids = [
    azurerm_network_interface.app-network-interface.id,
  ]

  admin_ssh_key {
    username   = "admin"
    public_key = file(".ssh/authorized_keys")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

