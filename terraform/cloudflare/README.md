# Cloudflare DNS Terraform Configuration

Manages DNS records for `zaman.lol` via Cloudflare API.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- Cloudflare API token with `Zone:DNS:Edit` permissions

## Setup

1. **Copy the example variables file:**

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. **Fill in your values in `terraform.tfvars`:**

   ```hcl
   cloudflare_api_token = "your-api-token"
   cloudflare_zone_id   = "your-zone-id"
   homelab_ip           = "your-public-ip"
   ```

   > Never commit `terraform.tfvars` - it's gitignored.

## Usage

### Initialize Terraform

Downloads providers and sets up the working directory:

```bash
terraform init
```

### Preview Changes

See what Terraform will do without making changes:

```bash
terraform plan
```

### Apply Changes

Create/update DNS records:

```bash
terraform apply
```

To auto-approve without confirmation:

```bash
terraform apply -auto-approve
```

### Destroy Resources

Remove all managed DNS records:

```bash
terraform destroy
```

### View Current State

```bash
terraform show
```

### Format Configuration

```bash
terraform fmt
```

### Validate Configuration

```bash
terraform validate
```

## Files

| File | Description |
|------|-------------|
| `providers.tf` | Terraform and Cloudflare provider configuration |
| `variables.tf` | Input variable definitions |
| `dns.tf` | DNS record resources |
| `outputs.tf` | Output values |
| `terraform.tfvars.example` | Example variables file (copy to `terraform.tfvars`) |

## Getting Cloudflare Credentials

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com)
2. **API Token:** Profile → API Tokens → Create Token → "Edit zone DNS" template
3. **Zone ID:** Select your domain → Overview → scroll down to "Zone ID"
