


resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region
  repository_id = var.repo_name
  description   = "example docker repository"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository_iam_member" "artifact_registry_reader" {
  repository = google_artifact_registry_repository.my-repo.id
  role       = "roles/artifactregistry.reader"
  member     = var.service_account
}