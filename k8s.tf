locals{
  clusters_name= ["paul","saj","jade","douglas","emannuel","olarewaju","oladipupo"]
}
resource "azurerm_kubernetes_cluster" "azrk8sclst" {
  name                = "example-aks1"
  location            = azurerm_resource_group.azureresourcegroup.location
  resource_group_name = azurerm_resource_group.azureresourcegroup.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = "var.client_id"
    client_secret = "var.client_secret"
  }
}
  tags = {
    Environment = "Production"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "k8sclstnp" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.azrk8sclste.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
}
output "client_certificate" {
  value = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw
}
