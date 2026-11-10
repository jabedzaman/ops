# =============================================================================
# Outputs
# =============================================================================

output "zone_name" {
  description = "The domain name managed by this configuration"
  value       = data.cloudflare_zone.main.name
}

output "lab_wildcard_hostname" {
  description = "Wildcard record hostname for homelab services"
  value       = cloudflare_record.lab_wildcard.hostname
}
