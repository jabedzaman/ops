# =============================================================================
# Outputs
# =============================================================================

output "zone_name" {
  description = "The domain name managed by this configuration"
  value       = data.cloudflare_zone.main.name
}

output "root_record_hostname" {
  description = "Root domain hostname"
  value       = cloudflare_record.root.hostname
}

output "wildcard_record_hostname" {
  description = "Wildcard record hostname"
  value       = cloudflare_record.wildcard.hostname
}
