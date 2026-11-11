# Home Ops 

This repository documents my infrastructure-as-code configurations for managing my homelab & machines.

## Architecture

- `k3s` is used as the Kubernetes distribution for my homelab environment.
- k3s' built-in ServiceLB (klipper-lb) provides LoadBalancer services within the k3s cluster.
- `traefik` serves as the ingress controller and reverse proxy for routing external traffic to services.
- k3s' built-in `local-path` provisioner provides persistent storage (single node).
- `sealed-secrets` manages encrypted secrets within the Kubernetes cluster.
- `letsencrypt` issues a wildcard `*.lab.jabed.dev` certificate via Cloudflare DNS-01.
- `tailscale` is how services are reached: `*.lab.jabed.dev` resolves to the node's Tailscale IP, so they're only reachable from the tailnet — no ports exposed publicly.
- `ansible` is employed for automating server configuration and management.
- `terraform` manages the `*.lab.jabed.dev` Cloudflare DNS record.

## Structure

- `ansible/`: ansible playbooks and inventories for quick server configuration and setup.
- `dotfiles/`: machine-specific configurations for my macOS and Linux setups.
- `k8s/`: k3s homelab management including helm charts and manifests.
- `terraform/`: infrastructure provisioning for cloud services (Cloudflare, etc.).

## Services

| Icon | Name | Category | Description | Deployed Via |
|------|------|----------|-------------|--------------|
| <img src="https://traefik.io/favicon.ico" width="24" height="24"> | Whoami | Monitoring & Management | Simple service to display client information | Kubectl |
| <img src="https://www.home-assistant.io/images/favicon-192x192.png" width="24" height="24"> | Home Assistant | Home Automation | Smart home hub (TP-Link/Tapo devices, exposed to Apple Home via HomeKit Bridge) | Helmfile |
