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

## Structure

- `ansible/`: ansible playbooks and inventories for quick server configuration and setup.
- `compose/`: (deprecated) my previous minimal home lab setup using traefik and docker-compose.
- `k8s/`: k3s homelab management including helm charts and manifests.
- `machines/`: machine-specific configurations for my macOS and Linux setups.

## Services

- `n8n`: Workflow automation tool 
- `minio`: S3-compatible object storage server
- `twingate`: Secure remote access solution

---

Future plans include adding the following services:

- `atlas`: mongo database hosting with atlas
- `logto`: centralized OIDC provider
- `gitea`: self-hosted git service + container registry
- `code-server`: remote VSCode instance
- `jackett`: torrent indexer

