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
- `dotfiles/`: machine-specific configurations for my macOS and Linux setups.
- `k8s/`: k3s homelab management including helm charts and manifests.
- `terraform/`: infrastructure provisioning for cloud services (Cloudflare, etc.).

## Services

| Icon | Name | Category | Description | Deployed Via |
|------|------|----------|-------------|--------------|
| <img src="https://n8n.io/favicon.ico" width="24" height="24"> | n8n | Automation | Workflow automation tool | Helmfile |
| <img src="https://mariadb.org/favicon.ico" width="24" height="24"> | MariaDB | Databases | Relational database service | Kubectl |
| <img src="https://www.mongodb.com/favicon.ico" width="24" height="24"> | MongoDB | Databases | Managed MongoDB database hosting | MongoDB Operator |
| <img src="https://redis.io/favicon.ico" width="24" height="24"> | Redis | Databases | In-memory data structure store | Helmfile |
| <img src="https://raw.githubusercontent.com/rancher/ui/master/public/assets/images/logos/welcome-cow.svg" width="24" height="24"> | Rancher | Monitoring & Management | K8s cluster management platform | Helmfile |
| <img src="https://traefik.io/favicon.ico" width="24" height="24"> | Whoami | Monitoring & Management | Simple service to display client information | Kubectl |
| <img src="https://raw.githubusercontent.com/minio/minio/master/.github/logo.svg" width="24" height="24"> | MinIO | Storage | S3-compatible object storage server | Helmfile |

