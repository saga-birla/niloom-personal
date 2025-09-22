# --------------------------------------------
# Provider Configuration
# --------------------------------------------
project_id       = "sagar-poc-project-env-2"
region           = "us-central1"
zone             = "us-central1-a"
credentials_file = "sagar-poc-project-env-2-dbcad439cb6b.json"

# --------------------------------------------
# VPC Configuration
# --------------------------------------------
vpc_name             = "my-custom-vpc-dev-stage"
subnet_ip_cidr_range = ["10.0.0.0/16"]

# --------------------------------------------
# Compute Engine Configuration
# --------------------------------------------
instance_name = "demo-instance-dev-stage"
machine_type  = "e2-medium"
boot_image    = "ubuntu-os-cloud/ubuntu-minimal-2204-lts"
disk_size_gb  = 30
disk_type     = "pd-balanced"
# --------------------------------------------

enable_gke = false

# -------------------------------------
# Redis Memorystore Configuration
# -------------------------------------

redis_name           = "demo-redis-dev-stage"
redis_memory_size_gb = 4
replica_count        = 1
redis_display_name   = "Demo Redis Instance"
redis_tier           = "STANDARD_HA"
# --------------------------------------------
