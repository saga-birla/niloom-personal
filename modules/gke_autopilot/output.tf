output "cluster_name" {
  value = google_container_cluster.autopilot.name
}

output "cluster_endpoint" {
  value = google_container_cluster.autopilot.endpoint
}

output "cluster_ca_certificate" {
  value = google_container_cluster.autopilot.master_auth.0.cluster_ca_certificate
}
