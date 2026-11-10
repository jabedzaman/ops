# =============================================================================
# Input Variables
# =============================================================================

variable "cloudflare_api_token" {
  description = "Cloudflare API token with Zone:DNS:Edit permissions"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for jabed.dev"
  type        = string
}

variable "lab_ip" {
  description = "Homelab's Tailscale IP that *.lab.jabed.dev resolves to"
  type        = string
  sensitive   = true
}
