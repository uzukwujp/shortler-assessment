

output "namespace" {
  description = "The Kubernetes namespace"
  value       = kubernetes_namespace.app_namespace.metadata[0].name
}

output "deployment_name" {
  description = "The name of the Kubernetes deployment"
  value       = kubernetes_deployment.app_deployment.metadata[0].name
}

output "service_name" {
  description = "The name of the Kubernetes service"
  value       = kubernetes_service.app_service.metadata[0].name
}

output "ingress_name" {
  description = "The name of the Kubernetes ingress"
  value       = kubernetes_ingress.app_ingress.metadata[0].name
}
