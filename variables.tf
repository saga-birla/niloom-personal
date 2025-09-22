########################################## Provider Configuration ##########################################
variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "region" {
  description = "The region where resources will be created."
  type        = string
}

variable "zone" {
  description = "The zone where resources will be created."
  type        = string
}

variable "credentials_file" {
  description = "Path to the GCP credentials file."
  type        = string
}
# ------------------------------
# VPC Variables
# ------------------------------
variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "my-custom-vpc"
}

variable "subnet_ip_cidr_range" {
  description = "List of CIDR ranges to create subnets"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# ------------------------------
# Compute Instance Variables
# ------------------------------
variable "instance_name" {
  description = "Name of the Compute Engine instance"
  type        = string
  default     = "demo-instance"
}

variable "machine_type" {
  description = "Machine type for the Compute Engine instance"
  type        = string
  default     = "e2-medium"
}

variable "boot_image" {
  description = "Boot disk image for the instance"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "disk_size_gb" {
  description = "Size of the boot disk in GB"
  type        = number
  default     = 20
}

variable "disk_type" {
  description = "Type of the boot disk (e.g., pd-standard, pd-ssd)"
  type        = string
  default     = "pd-standard"
}

# ------------------------------
# GKE Autopilot Cluster Variables
# ------------------------------
variable "enable_gke" {
  description = "Whether to create the GKE cluster"
  type        = bool
}

variable "cluster_name" {
  description = "Name of the GKE Autopilot cluster"
  type        = string
  default     = "demo-autopilot-cluster"
}

variable "release_channel" {
  description = "GKE release channel (RAPID, REGULAR, STABLE)"
  type        = string
  default     = "REGULAR"
}

# ----------------- memorystore redis Variables
variable "redis_name" {
  default     = "demo-redis"
  type        = string
  description = "Name of Redis instance"
}

variable "redis_memory_size_gb" {
  default     = 4
  type        = number
  description = "Memory size of Redis instance in GB"
}

variable "replica_count" {
  default     = 1
  description = "Number of read replicas"
  type        = number
}

variable "redis_display_name" {
  description = "Display name for the Redis instance"
  type        = string
}

variable "redis_tier" {
  default     = "STANDARD_HA"
  description = "Tier of the Redis instance (e.g., BASIC, STANDARD_HA)"
  type        = string

}
