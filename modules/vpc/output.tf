output "vpc_self_link" {
  description = "The self-link of the VPC network"
  value       = google_compute_network.vpc_network.self_link
}

output "subnet_self_link" {
  description = "The self-links of all created subnetworks"
  value       = [for s in google_compute_subnetwork.subnet-terraform : s.self_link]
}
