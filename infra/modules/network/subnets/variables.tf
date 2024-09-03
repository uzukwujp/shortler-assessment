

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

variable "network" {
  type = string
  description = "reference to the vpc"  
}