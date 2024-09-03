

module "vpc" {
  source                           = "./modules/network/vpc"
  vpc_name                         = var.vpc_name
  region                           = var.region
  internal_firewall_source_ranges  = var.internal_firewall_source_ranges
  firewall_ssh_source_ranges       = var.firewall_ssh_source_ranges 
}

module "subnet" {
  source         = "./modules/network/subnets"
  subnets        =  var.subnets
  network        =  module.vpc.vpc_id
  depends_on     =  [ module.vpc ]  
}

module "jump-server" {
  source           = "./modules/compute/jump-server"
  network_id       = module.vpc.vpc_id
  subnet_id        = module.subnet.subnet_ids[0]
  zone             = var.zone
  project_id       = var.project_id
  jump_server_name = var.jump_server_name
  region           = var.region
  depends_on       = [ module.subnet ]
}

module "gke" {
  source                = "./modules/compute/GKE"
  zone                  = var.zone
  cluster_name          = var.cluster_name
  network               = module.vpc.vpc_id
  release_channel       = var.release_channel
  nodepool_name         = var.nodepool_name
  service_account_name  = var.service_account_name 
  project_id            = var.project_id
  jump_server_name      = var.jump_server_name
  subnetwork            = module.subnet.subnet_ids[0] 
  depends_on            = [module.vpc, module.subnet,module.jump-server] 
}

module "container_registry" {
  source            =  "./modules/image-registry"
  repo_name         = var.repo_name
  region            = var.region
  service_account   = module.gke.node_pool_service_account
  project_id        = var.project_id
  depends_on        = [ module.gke ]
}