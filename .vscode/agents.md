# Agent Prompt - Infrastructure Operations Repository

This document provides context for AI coding agents working with this repository.

## Repository Overview

This is an infrastructure-as-code (IaC) repository for managing personal homelab and cloud infrastructure. It contains Kubernetes manifests, Helm configurations, Ansible playbooks, and machine-specific dotfiles.

---

## Directory Structure

```
ops/
├── .github/
│   └── workflows/           # GitHub Actions CI/CD
│       ├── yaml-lint.yaml   # YAML linting for ansible/ and k8s/
│       └── k8s-validate.yaml # Kubernetes manifest validation
│
├── .vscode/                 # VS Code workspace settings
│   ├── extensions.json      # Recommended extensions
│   ├── settings.json        # Workspace settings
│   └── agents.md            # This file - AI agent context
│
├── ansible/                 # Server provisioning & configuration
│   ├── configure.yml        # Main playbook entry point
│   ├── setup.sh             # Bootstrap script
│   ├── inventories/
│   │   └── hosts.ini        # Ansible inventory
│   └── playbooks/
│       ├── setup_git.yml
│       ├── setup_helm.yml
│       ├── setup_helmfile.yml
│       ├── setup_k3s.yml
│       ├── setup_kubeseal.yml
│       ├── setup_ssh.yml
│       ├── setup_ufw.yml
│       └── files/
│           └── authorized_keys
│
├── k8s/                     # Kubernetes configurations
│   ├── helmfile.yaml        # Helmfile for declarative Helm releases
│   │
│   ├── helm/
│   │   └── values/          # Helm chart value overrides
│   │       ├── longhorn/    # Distributed storage
│   │       ├── metallb/     # Bare-metal load balancer
│   │       ├── minio/       # S3-compatible object storage
│   │       ├── n8n/         # Workflow automation
│   │       ├── traefik/     # Ingress controller
│   │       └── twingate/    # Zero-trust network access
│   │
│   ├── manifests/
│   │   ├── namespaces/      # Namespace definitions
│   │   └── secrets/
│   │       ├── templates/   # Secret templates (DO NOT COMMIT REAL VALUES)
│   │       └── sealed-secrets/ # Encrypted secrets (safe to commit)
│   │
│   ├── middleware/          # Traefik middleware configs
│   │   ├── longhorn/
│   │   └── traefik/
│   │
│   ├── ingress-routes/      # Traefik IngressRoute definitions
│   │   ├── longhorn/
│   │   ├── minio/
│   │   └── n8n/
│   │
│   └── apps/                # Custom application manifests
│       └── whoami/          # Test deployment
│
├── machines/                # Machine-specific dotfiles
│   ├── darwin/              # macOS configs
│   │   ├── brewfile
│   │   └── users/jabed/zed/
│   └── linux/               # Linux configs
│       └── .config/
│
├── .yamllint                # YAML linting configuration
├── README.md                # Repository documentation
├── CLAUDE.md                # Claude AI specific instructions
└── SECURITY.md              # Security policy
```

---

## Key Technologies

| Component | Technology | Purpose |
|-----------|------------|---------|
| Kubernetes | K3s | Lightweight Kubernetes distribution |
| Ingress | Traefik v2 | Reverse proxy, TLS termination, routing |
| Storage | Longhorn | Distributed block storage for PVCs |
| Load Balancer | MetalLB | Bare-metal load balancer |
| Secrets | Sealed Secrets | GitOps-friendly encrypted secrets |
| Object Storage | MinIO | S3-compatible storage |
| Automation | n8n | Workflow automation platform |
| VPN/Access | Twingate | Zero-trust network access |
| DNS/TLS | Cloudflare | DNS management, ACME DNS-01 challenges |
| Provisioning | Ansible | Server configuration management |
| Helm Management | Helmfile | Declarative Helm chart deployment |

---

## Conventions & Patterns

### Secrets Management
1. **Never commit plaintext secrets** - Use sealed secrets only
2. Template files in `k8s/manifests/secrets/templates/` show structure
3. Seal secrets using: `kubeseal --controller-name=sealed-secrets --controller-namespace=sealed-secrets --format yaml`
4. Sealed secrets go in `k8s/manifests/secrets/sealed-secrets/`

### Helm Releases (helmfile.yaml)
- All Helm releases defined in `k8s/helmfile.yaml`
- Values files in `k8s/helm/values/<chart-name>/values.yaml`
- Use `presync` hooks to apply namespaces and sealed secrets before chart installation
- Pattern:
  ```yaml
  - name: <app>
    namespace: <app>
    chart: <repo>/<chart>
    values:
      - helm/values/<app>/values.yaml
    hooks:
      - events: ["presync"]
        command: "kubectl"
        args: ["apply", "-f", "manifests/namespaces/<app>.yaml"]
      - events: ["presync"]
        command: "kubectl"
        args: ["apply", "-f", "manifests/secrets/sealed-secrets/sealed-secret-<app>.yaml"]
  ```

### Ingress Routes
- Use Traefik `IngressRoute` CRD (not standard Ingress)
- TLS via Cloudflare DNS-01 challenge (`certResolver: cloudflare`)
- Domain pattern: `<service>.zaman.lol`
- Files in `k8s/ingress-routes/<service>/`

### Namespaces
- One namespace per application
- Defined in `k8s/manifests/namespaces/<app>.yaml`
- Applied via helmfile presync hooks

### Storage
- Use `storageClass: longhorn` for persistent volumes
- Default replication handled by Longhorn

---

## Common Commands

```bash
# Deploy all Helm releases
cd k8s && helmfile sync

# Deploy specific release
helmfile -l name=<release> sync

# Diff before applying
helmfile diff

# Apply Ansible playbooks
cd ansible && ansible-playbook -i inventories/hosts.ini configure.yml

# Seal a secret
kubeseal --controller-name=sealed-secrets --controller-namespace=sealed-secrets --format yaml < secret.yaml > sealed-secret.yaml

# Check cluster status
kubectl get pods -A
```

---

## Exposed Services

| Service | URL | Port | Auth |
|---------|-----|------|------|
| Traefik Dashboard | `k3s.zaman.lol` | 443 | Basic Auth |
| Longhorn Dashboard | `longhorn.zaman.lol` | 443 | Basic Auth |
| MinIO Console | `minio.zaman.lol` | 443 | MinIO Auth |
| MinIO S3 API | `s3.zaman.lol` | 443 | S3 Auth |
| n8n | `n8n.zaman.lol` | 443 | n8n Auth |

---

## Important Notes for Agents

1. **Security First**: Never output or log actual secret values
2. **Sealed Secrets**: Always use kubeseal for secrets, never commit plaintext
3. **Test Changes**: Use `helmfile diff` before `helmfile sync`
4. **Storage**: All persistent workloads should use Longhorn storage class
5. **Ingress**: Use Traefik IngressRoute CRD with cloudflare certResolver
6. **Namespaces**: Create namespace manifests, don't rely on `createNamespace: true` alone
7. **Consistency**: Follow existing patterns in the codebase
8. **Documentation**: Update relevant README files when adding new components

