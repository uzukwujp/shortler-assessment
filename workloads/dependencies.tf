
data "google_container_cluster" "my_cluster" {
  name     = var.cluster_name
  location = var.location
}