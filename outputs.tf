output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.app.name
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.app.name
}

output "kubernetes_version" {
  description = "Kubernetes version used by the AKS cluster"
  value       = azurerm_kubernetes_cluster.app.kubernetes_version
}

output "kube_config" {
  description = "Raw kubeconfig used to connect to the AKS cluster"
  value       = azurerm_kubernetes_cluster.app.kube_config_raw
  sensitive   = true
}