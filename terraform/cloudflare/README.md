# Cloudflare DNS Terraform Configuration

Manages the homelab's DNS record in the `jabed.dev` zone via Cloudflare API:
`*.lab.jabed.dev` → the homelab's Tailscale IP (DNS-only, not proxied), so every
service is reachable as `<service>.lab.jabed.dev` from tailnet devices only.

Only this one record is managed — the rest of the `jabed.dev` zone is untouched.

> The record was first created by hand in the dashboard. Before the first
> `terraform apply`, import it so Terraform doesn't try to create a duplicate:
>
> ```bash
> terraform import cloudflare_record.lab_wildcard <zone-id>/<record-id>
> ```

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
   lab_ip               = "your-tailscale-ip"
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
