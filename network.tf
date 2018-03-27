// Google Cloud Platform Resources
resource "google_compute_network" "our_development_network" {
  name                    = "${var.network_name}"
  auto_create_subnetworks = "true"
}

// Amazon Web Services Resources
resource "aws_vpc" "new_vpc_environment" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "${var.vpc_name}"
  }
}

resource "aws_security_group" "subnet" {
  vpc_id = "${aws_vpc.new_vpc_environment.id}"

  ingress {
    cidr_blocks = ["${aws_vpc.new_vpc_environment.cidr_block}"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
}

// Azure Network Resources
resource "azurerm_resource_group" "blue_world_terraforming" {
  name     = "blueland-resource-group"
  location = "West US 1"
}

resource "azurerm_network_security_group" "azy-example-three-security-group" {
  name                = "acceptanceTestSecurityGroup1"
  location            = "${azurerm_resource_group.blue_world_terraforming.location}"
  resource_group_name = "${azurerm_resource_group.blue_world_terraforming.name}"
}

resource "azurerm_virtual_network" "azy-example-three-virtual-network" {
  name                = "virtualNetwork1"
  resource_group_name = "${azurerm_resource_group.blue_world_terraforming.name}"
  address_space       = ["10.0.0.0/16"]
  location            = "West US"
  dns_servers         = "${var.dns_servers}"

  subnet {
    name           = "${var.subnet_names["subnet1"]}"
    address_prefix = "${var.subnet_address_prefixes["subnet1"]}"
    security_group = "${azurerm_network_security_group.azy-example-three-security-group.id}"
  }

  subnet {
    name           = "${var.subnet_names["subnet2"]}"
    address_prefix = "${var.subnet_address_prefixes["subnet2"]}"
    security_group = "${azurerm_network_security_group.azy-example-three-security-group.id}"
  }

  tags {
    environment = "Production-one"
  }
}

resource "azurerm_subnet" "subnet_three" {
  name                 = "${var.subnet_names["subnet3"]}"
  resource_group_name  = "${azurerm_resource_group.blue_world_terraforming.name}"
  virtual_network_name = "${azurerm_virtual_network.azy-example-three-virtual-network.name}"
  address_prefix       = "10.0.1.0/24"
}