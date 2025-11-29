# =============================================================================
# Cloudflare DNS Records
# =============================================================================

data "cloudflare_zone" "main" {
  zone_id = var.cloudflare_zone_id
}

# -----------------------------------------------------------------------------
# Root Domain (A Record)
# -----------------------------------------------------------------------------

resource "cloudflare_record" "root" {
  zone_id = var.cloudflare_zone_id
  name    = "@"
  content = var.homelab_ip
  type    = "A"
  ttl     = 1 # Auto TTL when proxied
  proxied = true
}

# -----------------------------------------------------------------------------
# Wildcard (A Record) - Catches all subdomains
# -----------------------------------------------------------------------------

resource "cloudflare_record" "wildcard" {
  zone_id = var.cloudflare_zone_id
  name    = "*"
  content = var.homelab_ip
  type    = "A"
  ttl     = 1
  proxied = true
}
