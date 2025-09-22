resource "google_container_cluster" "autopilot" {
  name     = var.cluster_name
  location = var.region

  enable_autopilot = true

  network    = var.network
  subnetwork = var.subnetwork

  deletion_protection = false

  release_channel {
    channel = var.release_channel
  }
}
