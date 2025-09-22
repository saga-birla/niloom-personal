# 🚀 GCP Infrastructure with Terraform

This project provisions **Google Cloud Platform (GCP)** infrastructure using **Terraform**.  
It supports multiple environments (`dev-stage` and `prod`) with isolated workspaces and configuration.

---

## 📌 Features
- **VPC & Subnets** – Base networking setup.
- **GKE Autopilot Cluster** – Provisioned only in `prod`.
- **Cloud SQL (PostgreSQL)**  
  - `dev-stage`: 2 Cloud SQL instances (PostgreSQL, 2 vCPUs each).  
  - `prod`: 1 Cloud SQL instance (PostgreSQL, 4 vCPUs).  
- Environment isolation with **Terraform Workspaces** and **tfvars files**.
- Automated deployments with PowerShell script (`deploy.ps1`).

---

## 📂 Project Structure
├── main.tf # Root Terraform config
├── variables.tf # Input variables
├── outputs.tf # Outputs
├── modules/
│ ├── vpc/ # VPC module
│ ├── gke_autopilot/ # GKE Autopilot module
│ └── cloudsql_postgres/ # CloudSQL module
├── dev-stage.tfvars # Dev-stage variables
├── prod.tfvars # Production variables
├── deploy.ps1 # Deployment script (Windows)
├── deploy.sh # Deployment script (Linux/Mac)
└── README.md # Project documentation

---

## ⚙️ Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed.
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed.
- GCP project with billing enabled.
- Authentication:
  ```bash
  gcloud auth application-default login
  gcloud config set project <PROJECT_ID>

## Enable required APIs
gcloud services enable compute.googleapis.com \
    container.googleapis.com \
    sqladmin.googleapis.com
    
---

## 🚦 Usage
1️⃣ Initialize Terraform
- terraform init

2️⃣ Select/Create Workspace
- terraform workspace new dev-stage   # create if not exists
- terraform workspace select dev-stage

- terraform workspace new prod        # create if not exists
- terraform workspace select prod

3️⃣ Plan & Apply
- terraform plan -var-file=dev-stage.tfvars
- terraform apply -var-file=dev-stage.tfvars

- terraform plan -var-file=prod.tfvars
- terraform apply -var-file=prod.tfvars

---

## 📝 Notes

- GKE Autopilot cluster is created only in prod.
- CloudSQL instances differ by environment:
- Dev-stage → 2 instances (2 vCPUs each).
- Prod → 1 instance (4 vCPUs).
- Sensitive values (like DB password) should be managed securely (e.g., Terraform Cloud variables or GCP Secret Manager).
- The deploy.ps1 and deploy.sh scripts automate init → plan → apply with color-coded logs for easy debugging.
