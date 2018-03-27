// resource "azurerm_network_interface" "test" {
//   name                = "acctni"
//   location            = "${azurerm_resource_group.blue_world_terraforming.location}"
//   resource_group_name = "${azurerm_resource_group.blue_world_terraforming.name}"

//   ip_configuration {
//     name                          = "testconfiguration1"
//     subnet_id                     = "${var.subnet_names["subnet1"]}"
//     private_ip_address_allocation = "dynamic"
//   }
// }
