// Google Compute Platform Variables
variable network_name {
  default = "defaultsetbutoverwritten"
  type = "string"
  description = "Just the network name for the Google Compute Platform."
}

// Azure Variables
variable subscription_id {}
variable client_id {}
variable client_secret {}
variable tenant_id {}

variable dns_servers {
  type = "list"
}

variable subnet_names {
  type = "map"
  default = {
    subnet1 = "subnetone"
    subnet2 = "subnettwo"
    subnet3 = "subnetthree"
  }
}

variable subnet_address_prefixes {
  type = "map"
  default = {
    subnet1 = "10.0.1.0/24"
    subnet2 = "10.0.2.0/24"
    subnet3 = "10.0.3.0/24"
  }
}

// Amazon Web Services Variables
variable vpc_name {
  default = "thisisthevpcname"
  type = "string"
  description = "Just the VPC name for the Amazon Web Services."
}
