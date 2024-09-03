


output "subnet_ids" {
  value = google_compute_subnetwork.subnet[*].id
  description = "List of the subnet ids"
}