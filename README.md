# Home Ops 

This repository documents my infrastructure-as-code configurations for managing my homelab & machines.

## Architecture

- `k3s` is used as the Kubernetes distribution for my homelab environment.
- k3s' built-in ServiceLB (klipper-lb) provides LoadBalancer services within the k3s cluster.
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
| <img src="https://www.mongodb.com/favicon.ico" width="24" height="24"> | MongoDB | Databases | Managed MongoDB database hosting | MongoDB Operator |
| <img src="https://traefik.io/favicon.ico" width="24" height="24"> | Whoami | Monitoring & Management | Simple service to display client information | Kubectl |

