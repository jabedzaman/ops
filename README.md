# Home Ops 

This repository documents my infrastructure-as-code configurations for managing my homelab & machines.

## Architecture

- `k3s` is used as the Kubernetes distribution for my homelab environment.
- `metallb` provides load balancing for services within the k3s cluster.
- `traefik` serves as the ingress controller and reverse proxy for routing external traffic to services.
- `longhorn` is utilized for distributed block storage across the k3s nodes.
- `sealed-secrets` manages encrypted secrets within the Kubernetes cluster.
- `letsencrypt` is configured for wildcard SSL certificates for secure access to services.
- `ansible` is employed for automating server configuration and management.
- `terraform` manages cloud infrastructure including Cloudflare DNS and GitHub settings.

## Structure

- `ansible/`: ansible playbooks and inventories for quick server configuration and setup.
- `k8s/`: k3s homelab management including helm charts and manifests.
- `machines/`: machine-specific configurations for my macOS and Linux setups.
- `terraform/`: infrastructure provisioning for cloud services (Cloudflare, etc.).

## Services

### Automation

| Icon | Name | Description | Deployed Via |
|------|------|-------------|--------------|
| <img src="https://n8n.io/favicon.ico" width="24" height="24"> | n8n | Workflow automation tool | Helmfile |

### Databases

| Icon | Name | Description | Deployed Via |
|------|------|-------------|--------------|
| <img src="https://www.mongodb.com/favicon.ico" width="24" height="24"> | MongoDB (Atlas) | Managed MongoDB database hosting | MongoDB Operator |
| <img src="https://mariadb.org/favicon.ico" width="24" height="24"> | MariaDB | Relational database service | Kubectl |
| <img src="https://redis.io/favicon.ico" width="24" height="24"> | Redis | In-memory data structure store | Helmfile |

### Media & Content

| Icon | Name | Description | Deployed Via |
|------|------|-------------|--------------|
| <img src="https://raw.githubusercontent.com/Jackett/Jackett/master/src/Jackett.Common/Content/favicon.ico" width="24" height="24"> | Jackett (planned) | Torrent indexer | Helmfile |
| <img src="https://raw.githubusercontent.com/go-gitea/gitea/main/assets/logo.svg" width="24" height="24"> | Gitea (planned) | Self-hosted Git service + container registry | Helmfile |

### Monitoring & Management

| Icon | Name | Description | Deployed Via |
|------|------|-------------|--------------|
| <img src="https://raw.githubusercontent.com/rancher/ui/master/public/assets/images/logos/welcome-cow.svg" width="24" height="24"> | Rancher | K8s cluster management platform | Helmfile |
| <img src="https://traefik.io/favicon.ico" width="24" height="24"> | Whoami | Simple service to display client information | Kubectl |

### Networking & Security

| Icon | Name | Description | Deployed Via |
|------|------|-------------|--------------|
| <img src="https://raw.githubusercontent.com/logto-io/logto/HEAD/logo.png" width="24" height="24"> | Logto (planned) | Centralized OIDC provider | Helmfile |
| <img src="https://cdn.brandfetch.io/idcXXNs4zE/w/400/h/400/theme/dark/icon.png?c=1dxbfHSJFAPEGdCLU4o5B" width="24" height="24"> | Twingate Connector | Secure remote access to private network | Helmfile |

### Storage

| Icon | Name | Description | Deployed Via |
|------|------|-------------|--------------|
| <img src="https://raw.githubusercontent.com/minio/minio/master/.github/logo.svg" width="24" height="24"> | MinIO | S3-compatible object storage server | Helmfile |

### Tools

| Icon | Name | Description | Deployed Via |
|------|------|-------------|--------------|
| <img src="https://code.visualstudio.com/favicon.ico" width="24" height="24"> | Code Server (planned) | Remote VSCode instance | Helmfile |

