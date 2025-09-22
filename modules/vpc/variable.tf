variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "subnet_ip_cidr_range" {
  description = "The IP CIDR range of the subnet"
  type        = list(string)
}

variable "region" {
  description = "The region where the subnet will be created"
  type        = string
}
