

vpc_name                        = "shortler-network"
region                          = "europe-west2"
zone                            = "europe-west2-a"
project_id                      = "calm-brook-434215-s7"
internal_firewall_source_ranges = ["10.0.0.0/8"]
firewall_ssh_source_ranges      = ["0.0.0.0/0"]
cluster_name                    = "shortler-cluster"
release_channel                 = "UNSPECIFIED"
service_account_name            = "shortler-app"
jump_server_ip                  = "34.142.42.78"
nodepool_name                   = "shortler-cluster-nodepool"
repo_name                       = "shortler-image-registry"
subnets                         = [{
  cidr = "10.0.0.0/24"
  name = "london"
  pod_cidr = "10.0.1.0/24"
  pod_range_name = "pod-ips"
  private_ip_google_access = true
  region = "europe-west2"
  service_cidr = "10.0.2.0/24"
  service_range_name = "service-ips"
},
{
  cidr = "10.0.4.0/24"
  name = "netherlands"
  pod_cidr = "10.0.3.0/24"
  pod_range_name = "pod-ips"
  private_ip_google_access = true
  region = "europe-west4"
  service_cidr = "10.0.5.0/24"
  service_range_name = "service-ips"
}]
