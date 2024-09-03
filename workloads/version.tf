
terraform {
  required_version = "1.5.7" 

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.32.0"
    }
  }
  backend "gcs" {
    bucket      = "shortler-remote-backend" 
    prefix      = "terraform/infra/state"             
  }
}