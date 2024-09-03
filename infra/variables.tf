
variable "vpc_name" {
  type = string
  description = "name of the vpc"  
}

variable "region" {
  type = string
  description = "the name of the region"  
}

variable "internal_firewall_source_ranges" {
  type = list(string)
  description = "IP ranges for internal firewall"  
}

variable "firewall_ssh_source_ranges" {
  type = list(string)
  description = "IP ranges for ssh firewall"  
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name                     = string
    cidr                     = string
    region                   = string
    private_ip_google_access = bool
    pod_range_name           = string
    pod_cidr                 = string
    service_range_name       = string
    service_cidr             = string
  }))
}

variable "project_id" {
  type = string
  description = "The project ID"  
}

variable "zone" {
  type = string
  description = "The availability zone of the selected region"  
}

variable "cluster_name" {
  type = string
  description = "The name of GKE cluster"  
}

variable "release_channel" {
  type = string
  description = "Defines how the cluster will be upgraded"  
}

variable "service_account_name" {
  type = string
  description = "The name of the nodepool service account"  
}

variable "nodepool_name" {
  type = string
  description = "The name of the nodepool"  
}

variable "repo_name" {
  type = string
  description = "The name of the image registry"  
}

variable "jump_server_ip" {
 type = string
 description = "jump server external Ip"  
}
