resource "google_redis_instance" "redis" {
  name               = var.name
  tier               = var.tier
  memory_size_gb     = var.memory_size_gb
  region             = var.region
  replica_count      = var.replica_count
  authorized_network = var.authorized_network
  display_name       = var.display_name
}
