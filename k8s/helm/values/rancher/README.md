# Rancher

[Rancher](https://www.rancher.com/) is a complete Kubernetes management platform that provides a unified interface for managing multiple Kubernetes clusters.

## Access

- **URL:** https://rancher.zaman.lol
- **Default Password:** `admin` (change after first login!)

## Configuration

| Setting | Value | Description |
|---------|-------|-------------|
| `hostname` | `rancher.zaman.lol` | External hostname |
| `replicas` | `1` | Single replica for homelab |
| `ingress.enabled` | `false` | Disabled - using Traefik IngressRoute |
| `tls.source` | `external` | TLS handled by Traefik/Cloudflare |
| `persistence.storageClass` | `longhorn` | Persistent storage |

## First Login

1. Navigate to https://rancher.zaman.lol
2. Enter the bootstrap password: `admin`
3. Set a new secure admin password
4. Accept the Rancher EULA

## Features

- **Cluster Management:** Import or create Kubernetes clusters
- **Workload Management:** Deploy and manage applications
- **RBAC:** User authentication and access control
- **Monitoring:** Built-in cluster monitoring and alerts
- **Catalog:** Helm chart repository management

## Resources

- [Rancher Documentation](https://ranchermanager.docs.rancher.com/)
- [Helm Chart Values](https://github.com/rancher/rancher/tree/release/v2.10/chart)
- [Rancher GitHub](https://github.com/rancher/rancher)

## Notes

- Rancher runs in the `cattle-system` namespace (required by Rancher)
- Uses `ServersTransport` for insecure backend connection (Rancher self-signed cert)
- Resource limits set conservatively for homelab use
