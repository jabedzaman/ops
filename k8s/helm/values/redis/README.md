# Redis Helm Values
This directory contains the Helm values configuration for Redis deployment.

## Configuration
- Uses Bitnami Redis chart
- Standalone architecture (no replication)
- Authentication enabled via sealed secret
- Persistent storage with Longhorn (8Gi)
- Exposed via Traefik IngressRoute at redis.zaman.lol

## Credentials
Credentials are stored in a sealed secret:
- Username: admin
- Password: (sealed)

To update credentials, modify the template in `manifests/secrets/templates/redis-credentials.template.yaml` and re-seal it.
