# --------------------------------------------
# Provider Configuration
# --------------------------------------------
project_id       = "sagar-poc-project"
region           = "us-central1"
zone             = "us-central1-a"
credentials_file = "sagar-poc-project-9f50cba3d92d.json"

# --------------------------------------------
# VPC Configuration
# --------------------------------------------
vpc_name             = "my-custom-vpc"
subnet_ip_cidr_range = ["10.0.0.0/16"]

# --------------------------------------------
# Compute Engine Configuration
# --------------------------------------------
instance_name = "demo-instance"
machine_type  = "e2-standard-4"
boot_image    = "ubuntu-os-cloud/ubuntu-minimal-2204-lts"
disk_size_gb  = 30
disk_type     = "pd-balanced"

# --------------------------------------------
# GKE Autopilot Cluster Configuration
# --------------------------------------------
enable_gke      = true
cluster_name    = "demo-autopilot-cluster"
release_channel = "REGULAR"

# -------------------------------------
# Redis Memorystore Configuration
# -------------------------------------

redis_name           = "demo-redis"
redis_memory_size_gb = 4
replica_count        = 1
redis_display_name   = "Demo Redis Instance"
redis_tier           = "STANDARD_HA"
# --------------------------------------------
