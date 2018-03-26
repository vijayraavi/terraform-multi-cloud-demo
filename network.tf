// Google Cloud Platform Resources
resource "google_compute_network" "our_development_network" {
  name                    = "${var.network_name}"
  auto_create_subnetworks = "true"
}

// Amazon Web Services Resources
resource "aws_vpc" "new_vpc_example_three" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "${var.vpc_name}"
  }
}

data "aws_subnet" "selected" {
  id = "${aws_vpc.new_vpc_example_three.id}"
}

resource "aws_security_group" "subnet" {
  vpc_id = "${data.aws_subnet.selected.vpc_id}"

  ingress {
    cidr_blocks = ["${data.aws_subnet.selected.cidr_block}"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
}

// Azure Network Resources
resource "azurerm_resource_group" "azy-example-three-resource-group" {
  name     = "acceptanceTestResourceGroup1"
  location = "West US"
}

resource "azurerm_network_security_group" "azy-example-three-security-group" {
  name                = "acceptanceTestSecurityGroup1"
  location            = "${azurerm_resource_group.azy-example-three-resource-group.location}"
  resource_group_name = "${azurerm_resource_group.azy-example-three-resource-group.name}"
}

resource "azurerm_virtual_network" "azy-example-three-virtual-network" {
  name                = "virtualNetwork1"
  resource_group_name = "${azurerm_resource_group.azy-example-three-resource-group.name}"
  address_space       = ["10.0.0.0/16"]
  location            = "West US"
  dns_servers         = "${var.dns_servers}"

  subnet {
    name           = "${var.subnet_names["subnet1"]}"
    address_prefix = "${var.subnet_address_prefixes["subnet1"]}"
  }

  subnet {
    name           = "${var.subnet_names["subnet2"]}"
    address_prefix = "${var.subnet_address_prefixes["subnet2"]}"
  }

  subnet {
    name           = "${var.subnet_names["subnet3"]}"
    address_prefix = "${var.subnet_address_prefixes["subnet3"]}"
    security_group = "${azurerm_network_security_group.azy-example-three-security-group.id}"
  }

  tags {
    environment = "Production-example-three"
  }
}