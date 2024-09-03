

variable "vpc_name" {

  type = string
  description = "The name of the vpc"
  
}

variable "internal_firewall_source_ranges" {
  type = list(string)
  description = "internal IP ranges for the firewall"
  
}

variable "firewall_ssh_source_ranges" {

  type = list(string)

  description = "IP ranges for allowed where ssh access is allowed"
  
}

variable "region" {
  
}