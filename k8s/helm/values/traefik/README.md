# Traefik Values

Helm values for deploying Traefik, a modern HTTP reverse proxy and load balancer.

## Key Configurations

- **Ports**: HTTP (80) and HTTPS (443) with HTTP/3 enabled
- **Service**: LoadBalancer type with MetalLB IP pool annotation
- **Dashboard**: Enabled at `k3s.zaman.lol` with authentication middleware
- **TLS**: Cloudflare DNS challenge for automatic certificates
- **Persistence**: 128Mi storage for ACME certificates
- **Logs**: General logs at INFO level, access logs enabled

## Secrets Required

- `cloudflare-api-token`: Secret containing Cloudflare DNS API token

## Notes

Update domain names and email address as needed. Ensure the Cloudflare secret is created before deployment.