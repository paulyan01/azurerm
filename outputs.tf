output "id" {
  value = [
    for cluster in azurerm_kubernetes_cluster.azrk8sclst: cluster.id
  ]
}

output "kube_config" {
  sensitive = true
  value = [ 
    for cluster in azurerm_kubernetes_cluster.azrk8sclst: cluster.kube_config_raw
  ]
}

output "client_key" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.azrk8sclst: cluster.kube_config.0.client_key
  ]
}

output "client_certificate" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.azrk8sclst: cluster.kube_config.0.client_certificate
  ]
}

output "cluster_ca_certificate" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.azrk8sclst: cluster.kube_config.0.cluster_ca_certificate
  ]
}

output "host" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.azrk8sclst: cluster.kube_config.0.host
  ]
}
