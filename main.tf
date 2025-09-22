# ------------------------------
# VPC Module
# ------------------------------
module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  region               = var.region
  subnet_ip_cidr_range = var.subnet_ip_cidr_range
}

# ------------------------------
# Compute Instance Module
# ------------------------------
module "compute_instance" {
  source        = "./modules/compute_instance"
  zone          = var.zone
  instance_name = var.instance_name
  machine_type  = var.machine_type
  boot_image    = var.boot_image
  disk_size_gb  = var.disk_size_gb
  disk_type     = var.disk_type
  network       = module.vpc.vpc_self_link
  subnetwork    = module.vpc.subnet_self_link[0]
}

# ------------------------------
# GKE Autopilot Cluster Module
# ------------------------------
module "gke_autopilot" {
  count           = var.enable_gke ? 1 : 0
  source          = "./modules/gke_autopilot"
  region          = var.region
  cluster_name    = var.cluster_name
  network         = module.vpc.vpc_self_link
  subnetwork      = module.vpc.subnet_self_link[0]
  release_channel = var.release_channel
}
# ------------------------------
# redis Module
# ------------------------------

module "redis" {
  source             = "./modules/memorystore_redis"
  name               = var.redis_name
  region             = var.region
  memory_size_gb     = var.redis_memory_size_gb
  replica_count      = var.replica_count
  authorized_network = module.vpc.vpc_self_link
  display_name       = var.redis_display_name
  tier               = var.redis_tier
}
