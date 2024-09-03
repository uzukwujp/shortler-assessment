

variable "repo_name" {
  type = string
  description = "The docker registry id"  
}

variable "region" {
  type = string
  description = "location of the registry"  
}

variable "service_account" {
  type = string
  description = "service account of the nodepool"  
}

variable "project_id" {
  type = string
  description = "project Id"  
}