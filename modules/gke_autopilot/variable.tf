
variable "region" {
  description = "The GCP region"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "network" {
  description = "The VPC network for the cluster"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork for the cluster"
  type        = string
}

variable "release_channel" {
  description = "GKE release channel"
  type        = string
  default     = "REGULAR"
}
