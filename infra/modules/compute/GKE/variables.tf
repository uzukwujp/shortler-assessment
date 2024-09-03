

variable "zone" {
  type = string
  description = "The location of the cluster"  
}

variable "cluster_name" {
  type = string
  description = "The name of the cluster"  
}

variable "network" {
  type = string
  description = "The network of the cluster"  
}

variable "release_channel" {
  type = string
  description = "This defines how the cluster will be upgraded"  
}

variable "nodepool_name" {
  type = string
  description = "The name of the nodepool"  
}

variable "service_account_name" {
  type = string
  description = "The name of the noodepool service account"  
}

variable "project_id" {
  type = string
  description = "The project ID"  
}

variable "subnetwork" {
  type = string
  description = "Equals to the value of the name of the vpc or self link of the vpc the cluster is deployed"  
}

variable "jump_server_ip" {
  type = string
  description = "The name of the jump server"  
}