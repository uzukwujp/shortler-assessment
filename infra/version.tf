
terraform {
  required_version = "1.5.7" 

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.0.1"
    }
  }

  backend "gcs" {
    bucket      = "shortler-remote-backend" 
    prefix      = "terraform/infra/state"             
  }
}