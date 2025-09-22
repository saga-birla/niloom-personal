resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "subnet-terraform" {
  count         = length(var.subnet_ip_cidr_range)
  name          = "subnet-${count.index}-${var.vpc_name}"
  ip_cidr_range = var.subnet_ip_cidr_range[count.index]
  region        = var.region
  network       = google_compute_network.vpc_network.id
}
