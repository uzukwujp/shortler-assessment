

resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network
  subnetwork = var.subnetwork
  deletion_protection = false

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "${var.jump_server_ip}/32" 
      display_name = "Jump_server"
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "10.0.6.0/28"
  }

  release_channel {
    channel = var.release_channel
  }
}

resource "google_service_account" "nodepool_service_account" {
  account_id   = var.service_account_name
  display_name = "nodepool-service-account"
}

resource "google_project_iam_member" "container_node_service_account" {
  project = var.project_id
  role    = "roles/container.nodeServiceAccount"
  member  = google_service_account.nodepool_service_account.member
}

resource "google_project_iam_member" "log_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = google_service_account.nodepool_service_account.member
}

resource "google_project_iam_member" "metric_writer" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = google_service_account.nodepool_service_account.member
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.nodepool_name
  location   = var.zone
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    service_account = google_service_account.nodepool_service_account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
