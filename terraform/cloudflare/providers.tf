# =============================================================================
# Terraform & Provider Configuration
# =============================================================================

terraform {
  required_version = ">= 1.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

# =============================================================================
# Cloudflare Provider
# =============================================================================

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
