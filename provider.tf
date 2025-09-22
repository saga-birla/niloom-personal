terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.43.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  credentials = file(var.credentials_file)
  region      = var.region
  #zone    = var.zone
}
