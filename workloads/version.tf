
terraform {
  required_version =  "1.9.5" 

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.32.0"
    }
  }
  backend "gcs" {
    bucket      = "shortler-remote-backend" 
    prefix      = "terraform/workload/state"             
  }
}