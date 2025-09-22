variable "name" {
  description = "Name of the Redis instance"
  type        = string
}

variable "display_name" {
  description = "Display name for Redis instance"
  type        = string
}

variable "region" {
  description = "Region where Redis instance will be created"
  type        = string
}

variable "memory_size_gb" {
  description = "Memory size in GB"
  type        = number
}

variable "replica_count" {
  description = "Number of read replicas"
  type        = number
}

variable "authorized_network" {
  description = "The VPC network the Redis instance will connect to (Self-link)"
  type        = string
}
variable "tier" {
  description = "The tier of the Redis instance (e.g., BASIC, STANDARD_HA)"
  type        = string
}
