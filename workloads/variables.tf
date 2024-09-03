


variable "namespace" {
  description = "The namespace to deploy the application"
  type        = string
}

variable "app_name" {
  description = "The name of the application"
  type        = string
}

variable "app_port" {
  description = "The port the application listens on"
  type        = number
}

variable "image" {
  description = "The Docker image for the application"
  type        = string
}

variable "replicas" {
  description = "Number of replicas"
  type        = number
  default     = 1
}

variable "cluster_name" {
  type = string
  description = "The name of the GKE cluster"  
}

variable "location" {
  type = string
  description = "location of the cluster"  
}


