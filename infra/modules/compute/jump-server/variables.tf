
variable "region" {
  type = string
  description = "The region where the instance is deployed"  
}

variable "zone" {
  type = string 
  description = "Availabilty zone where the instance is deployed" 
}

variable "network_id" {
  type = string
  description = "Network Id where the instance is deployed"  
}

variable "subnet_id" {
  type = string
  description = "subnet Id where the instance is deployed"  
}

variable "project_id" {
  type = string
  description = "Google project Id"  
}

variable "jump_server_name" {
  type = string
  description = " The name of the jump server"  
}