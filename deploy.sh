#!/bin/bash

#### pre-requisites ####
#enable these APIs in your GCP project:
# gcloud services enable \
#     cloudresourcemanager.googleapis.com \
#     compute.googleapis.com \
#     container.googleapis.com \
#     redis.googleapis.com \
#     sqladmin.googleapis.com \
#     servicenetworking.googleapis.com



######Steps to run this script######
#step-1: make the scrit executable by running the command: chmod +x deploy.sh
#step-2: run the script by executing the command: ./deploy.sh dev-stage
#step-3: or run the script by executing the command: ./deploy.sh prod

# === Input validation ===
if [[ "$1" != "dev-stage" && "$1" != "prod" ]]; then
  echo -e "\033[31m Usage: ./deploy.sh [dev-stage|prod]\033[0m"
  exit 1
fi

env="$1"
tfvars_file="terraform-$env.tfvars"

# === Functions ===
info() {
  echo -e "\033[36m$1\033[0m"  # Cyan
}

success() {
  echo -e "\033[32m$1\033[0m"  # Green
}

error() {
  echo -e "\033[31m$1\033[0m"  # Red
}

# === Start ===
info "Starting deployment for environment: $env"

# Check .tfvars file
if [[ ! -f "$tfvars_file" ]]; then
  error "tfvars file '$tfvars_file' not found."
  exit 1
fi

# Check and create workspace if needed
if terraform workspace list | grep -q "$env"; then
  info "Switching to workspace: $env"
  terraform workspace select "$env"
else
  info "Creating workspace: $env"
  terraform workspace new "$env"
fi

# Terraform Init
info "Running terraform init..."
terraform init
if [[ $? -ne 0 ]]; then
  error "terraform init failed"
  exit 1
fi
success "terraform init completed"

# Terraform Plan
info "Running terraform plan with $tfvars_file..."
terraform plan -var-file="$tfvars_file"
if [[ $? -ne 0 ]]; then
  error "terraform plan failed"
  exit 1
fi
success "terraform plan completed"

# Terraform Apply
info "Running terraform apply with $tfvars_file..."
terraform apply -var-file="$tfvars_file" -auto-approve
if [[ $? -ne 0 ]]; then
  error "terraform apply failed"
  exit 1
fi
success "terraform apply completed successfully"
