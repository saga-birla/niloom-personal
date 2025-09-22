variable "zone" {
  description = "The zone to deploy the instance"
  type        = string
}

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type"
  type        = string
}

variable "boot_image" {
  description = "Boot disk image"
  type        = string
}

variable "disk_size_gb" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "Boot disk type (e.g., pd-standard, pd-ssd)"
  type        = string
  default     = "pd-standard"
}

variable "network" {
  description = "VPC network"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork"
  type        = string
}
