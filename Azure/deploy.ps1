param(
    [Parameter(Mandatory=$false)]
    [switch]$Init = $false
)

# Set working directory
Push-Location $PSScriptRoot

# Initialize Terraform if requested
if ($Init) {
    Write-Host "Initializing Terraform..."
    terraform init
}

# Apply the infrastructure
Write-Host "Deploying shared Azure infrastructure..."
terraform apply

# Show outputs
Write-Host "Infrastructure deployed successfully!" -ForegroundColor Green
Write-Host "Outputs:"
terraform output

Pop-Location 