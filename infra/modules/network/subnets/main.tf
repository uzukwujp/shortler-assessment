

resource "google_compute_subnetwork" "subnet" {
  count                     = length(var.subnets)
  name                      = var.subnets[count.index].name
  ip_cidr_range             = var.subnets[count.index].cidr
  region                    = var.subnets[count.index].region
  network                   = var.network
  private_ip_google_access  = var.subnets[count.index].private_ip_google_access

  # First secondary IP range for pods
  secondary_ip_range {
    range_name    = var.subnets[count.index].pod_range_name
    ip_cidr_range = var.subnets[count.index].pod_cidr
  }
  # Second secondary IP range for services
  secondary_ip_range {
    range_name    = var.subnets[count.index].service_range_name
    ip_cidr_range = var.subnets[count.index].service_cidr
  }
  lifecycle {
    ignore_changes = [secondary_ip_range]
  }
}