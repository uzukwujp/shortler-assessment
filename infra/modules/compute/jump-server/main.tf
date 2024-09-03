


resource "google_compute_address" "vm_external_ip" {
  name   = "vm-external-ip"
  region = var.region
}

resource "google_compute_instance" "vm_instance" {
  name         = var.jump_server_name
  machine_type = "e2-medium"
  zone         = var.zone
  labels = {
    purpose = "runner"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  # Attach the service account to the VM
  service_account {
    email  = google_service_account.vm_service_account.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id

    # Assign the external IP address to the instance
    access_config {
      nat_ip = google_compute_address.vm_external_ip.address
    }
  }
}

# Create a service account
resource "google_service_account" "vm_service_account" {
  account_id   = "vm-service-account"
  display_name = "VM Service Account"
}

# Assign IAM roles to the service account
resource "google_project_iam_member" "gke_admin_role" {
  project = var.project_id
  role    = "roles/container.clusterAdmin"
  member  = "serviceAccount:${google_service_account.vm_service_account.email}"
}

resource "google_project_iam_member" "iam_service_account_user_role" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.vm_service_account.email}"
}