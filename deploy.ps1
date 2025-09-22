#### pre-requisites ####
#enable these APIs in your GCP project:
# gcloud services enable \
#     cloudresourcemanager.googleapis.com \
#     compute.googleapis.com \
#     container.googleapis.com \
#     redis.googleapis.com \
#     sqladmin.googleapis.com \
#     servicenetworking.googleapis.com


#######how to use this script#########
#   run this command in terminal for dev-stage env = .\deploy.ps1 -env dev-stage
#   run this command in terminal for prod env = .\deploy.ps1 -env prod
param (
    [Parameter(Mandatory = $true)]
    [ValidateSet("dev-stage", "prod")]
    [string]$env
)

# === Configuration ===
$tfVarsFile = "terraform-$env.tfvars"

# === Functions ===
function Write-Success($message) {
    Write-Host $message -ForegroundColor Green
}

function Write-ErrorMsg($message) {
    Write-Host $message -ForegroundColor Red
}

function Write-Info($message) {
    Write-Host $message -ForegroundColor Cyan
}

# === Execution ===

Write-Info "Starting deployment for environment: $env"

# Validate tfvars file
if (!(Test-Path $tfVarsFile)) {
    Write-ErrorMsg "tfvars file '$tfVarsFile' not found."
    exit 1
}

# Select or create workspace
$workspaceExists = terraform workspace list | Select-String "^\s*$env$"
if ($workspaceExists) {
    Write-Info "Switching to workspace: $env"
    terraform workspace select $env
} else {
    Write-Info "Creating workspace: $env"
    terraform workspace new $env
}

# Terraform Init
Write-Info "Running terraform init..."
terraform init
if ($LASTEXITCODE -ne 0) {
    Write-ErrorMsg "terraform init failed"
    exit 1
}
Write-Success "terraform init completed"

# Terraform Plan
Write-Info "Running terraform plan with $tfVarsFile..."
terraform plan -var-file $tfVarsFile
if ($LASTEXITCODE -ne 0) {
    Write-ErrorMsg "terraform plan failed"
    exit 1
}
Write-Success "terraform plan completed"

# Terraform Apply
Write-Info "Running terraform apply with $tfVarsFile..."
terraform apply -var-file $tfVarsFile -auto-approve
if ($LASTEXITCODE -ne 0) {
    Write-ErrorMsg "terraform apply failed"
    exit 1
}
Write-Success "terraform apply completed successfully"
