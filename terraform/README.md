# Terraform

Terraform configurations for managing cloud infrastructure.

## Modules

| Module | Description |
|--------|-------------|
| [cloudflare](./cloudflare/) | DNS records management for the homelab domain |

## Quick Start

```bash
cd terraform/cloudflare
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init
terraform plan
terraform apply
```
