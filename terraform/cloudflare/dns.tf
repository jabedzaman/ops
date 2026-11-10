# =============================================================================
# Cloudflare DNS Records (jabed.dev zone)
# =============================================================================
# Only the homelab's own records are managed here — the rest of the jabed.dev
# zone (root site, mail, etc.) is left alone.

data "cloudflare_zone" "main" {
  zone_id = var.cloudflare_zone_id
}

# -----------------------------------------------------------------------------
# *.lab.jabed.dev -> homelab's Tailscale IP
# -----------------------------------------------------------------------------
# DNS-only (not proxied): the target is a Tailscale address, so only devices
# on the tailnet can reach it, and Cloudflare's proxy couldn't anyway.
# TLS comes from traefik's Cloudflare DNS-01 wildcard cert.

resource "cloudflare_record" "lab_wildcard" {
  zone_id = var.cloudflare_zone_id
  name    = "*.lab"
  content = var.lab_ip
  type    = "A"
  ttl     = 1
  proxied = false
}
