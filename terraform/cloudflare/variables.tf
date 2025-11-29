# =============================================================================
# Input Variables
# =============================================================================

variable "cloudflare_api_token" {
  description = "Cloudflare API token with Zone:DNS:Edit permissions"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for the domain"
  type        = string
}

variable "homelab_ip" {
  description = "Public IP address of the homelab server"
  type        = string
  sensitive   = true
}
