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
    subnet1 = "subnet1"
    subnet2 = "subnet2"
    subnet3 = "subnet3"
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

variable "linux_admin_username" {
  type        = "string"
  description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
}

variable "linux_admin_password" {
  type ="string"
  description = "The password for the Linux admin account."
}

variable "ssh_key" {
  type = "string"
  description = "SSH Key for Kubernetes Clusters."
}

variable "azure_node_count" {
  type = "string"
  description = "Count of cluster instances to start."
}

variable "azure_cluster_prefix" {
  type = "string"
  description = "The prefix for the Azure cluster."
}

// Amazon Web Services Variables
variable vpc_name {
  default = "thisisthevpcname"
  type = "string"
  description = "Just the VPC name for the Amazon Web Services."
}

// Google Compute Platform Variables
variable network_name {
  default = "defaultsetbutoverwritten"
  type = "string"
  description = "Just the network name for the Google Compute Platform."
}