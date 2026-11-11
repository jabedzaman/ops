# Home Ops

Infrastructure-as-code for my homelab and machines.

- `k8s/`: single-node k3s with Traefik (wildcard `*.lab.jabed.dev` cert via Cloudflare DNS-01), Sealed Secrets and `local-path` storage. Reachable only over Tailscale.
- `ansible/`: server setup.
- `terraform/`: Cloudflare DNS.
- `.extras/dotfiles/`: macOS and Linux configs.

Common commands: `task --list` ([Taskfile](https://taskfile.dev)).

## Services

| Name | Description | Deployed via |
|------|-------------|--------------|
| Home Assistant | Smart home hub (Tapo, Apple Home via HomeKit Bridge) | Helmfile |
| Whoami | Request echo / test service | Helmfile |
