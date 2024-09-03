


output "image_registry_url" {
  value = module.container_registry.repo_url
  description = "The registry url used for tagging images"
}


output "cluster_endpoint" {
  value = module.gke.kubernetes_cluster_endpoint
  description = "The cluster endpoint"  
}