
data "google_compute_instance" "jump_server" {
  name   = var.jump_server_name
  zone   = var.zone
}