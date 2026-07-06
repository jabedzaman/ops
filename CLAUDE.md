# CLAUDE.md - Claude AI Instructions

This file provides specific instructions for Claude AI when working with this repository.

## Repository Context

This is an infrastructure-as-code repository for a personal homelab running K3s Kubernetes.

## Critical Rules

### 🔴 Security - NEVER Do These

1. **Never output actual secret values** - Even if found in files, don't display them
2. **Never commit plaintext secrets** - Always use Sealed Secrets
3. **Never store credentials in values.yaml** - Reference secrets via `existingSecret`
4. **Never expose internal IPs or sensitive endpoints** in documentation

### 🟢 Always Do These

1. **Use Sealed Secrets pattern** for any sensitive data
2. **Follow existing file structure** - Check similar components for patterns
3. **Use Longhorn storage class** for persistent volumes
4. **Use Traefik IngressRoute** (not standard Ingress) with `certResolver: cloudflare`
5. **Add presync hooks** in helmfile for namespaces and sealed secrets

## File Patterns

When adding a new Helm-managed application, all files live together in one directory:

```
k8s/
├── helmfile.yaml
├── infra/<name>/          # cluster infra (traefik, metallb, longhorn, sealed-secrets)
│   ├── release.yaml       # helmfile release
│   ├── release.lock
│   ├── values.yaml
│   ├── namespace.yaml
│   ├── ingress-route.yaml
│   ├── middleware.yaml
│   ├── sealed-secret*.yaml
│   └── secret.template.yaml
└── apps/<name>/           # workloads
    ├── release.yaml
    ├── release.lock
    ├── values.yaml
    ├── namespace.yaml
    ├── ingress-route.yaml
    ├── sealed-secret.yaml
    └── secret.template.yaml
```

Paths in `release.yaml` hooks/values are relative to the release.yaml file. Since everything is co-located, use just the filename (e.g. `namespace.yaml`, not a long relative path).

## Domain Convention

All services use: `<service>.zaman.lol`

## Common Tasks

### Adding a New Application

1. Create namespace manifest
2. Create secret template (for documentation)
3. Generate and seal the actual secret
4. Create Helm values file
5. Add release to helmfile.yaml with presync hooks
6. Create IngressRoute if web-accessible
7. Deploy with `helmfile -l name=<app> sync`

### Sealing a Secret

```bash
cat <<EOF | kubeseal --controller-name=sealed-secrets --controller-namespace=sealed-secrets --format yaml > sealed-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
  namespace: my-namespace
type: Opaque
stringData:
  key: "value"
EOF
```

## Contact

Repository owner: **hi@jabed.dev**
