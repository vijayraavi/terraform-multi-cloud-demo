 // ----- Azure Kubernetes Setup -----

 resource "azurerm_container_service" "blue-kube" {
   name                   = "acctestcontservice1"
   location               = "${azurerm_resource_group.blue_world_terraforming.location}"
   resource_group_name    = "${azurerm_resource_group.blue_world_terraforming.name}"
   orchestration_platform = "Kubernetes"

   master_profile {
     count = 1
     dns_prefix = "${var.azure_cluster_prefix}"
   }

   linux_profile {
     admin_username = "${var.linux_admin_username}"

     ssh_key {
       key_data = "${var.ssh_key}"
     }
   }

   agent_pool_profile {
     name = "default"
     count = "${var.azure_node_count}"
     dns_prefix = "kuby.house"
     vm_size = "Standard_A0"
   }

   service_principal {
     client_id = "${var.client_id}"
     client_secret = "${var.client_secret}"
   }

   diagnostics_profile {
     enabled = false
   }

   tags {
     Environment = "Production"
   }
 }