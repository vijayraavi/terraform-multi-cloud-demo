provider "google" {
  credentials = "${file("../secrets/account.json")}"
  project = "thrashingcorecode"
  region = "us-west1"
}

provider "aws" {
  region = "us-west-2"
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

provider "vsphere" {
  user           = "admin_account"
  password       = "secret_password"
  vsphere_server = "server_uri_for_the_sphere"
  # Because Seattle Sea Sound Transit Authority has a self-signed cert
  allow_unverified_ssl = true
}
