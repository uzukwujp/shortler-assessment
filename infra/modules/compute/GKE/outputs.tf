

output "kubernetes_cluster_name" {
  value = google_container_cluster.gke_cluster.name
}

output "kubernetes_cluster_endpoint" {
  value = google_container_cluster.gke_cluster.endpoint
}

output "kubernetes_cluster_ca_certificate" {
  value = base64decode(google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate)
}

output "node_pool_service_account" {
  value =  google_service_account.nodepool_service_account.member
}