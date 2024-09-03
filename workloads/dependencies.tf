
data "google_container_cluster" "my_cluster" {
  name     = var.cluster_name
  location = var.location
  project  = var.project_id
}

data "google_client_config" "default" {
}