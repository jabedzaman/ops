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
3. **Use the default `local-path` storage class** for persistent volumes (single-node cluster)
4. **Use Traefik IngressRoute** (not standard Ingress) with `certResolver: cloudflare`
5. **Inherit the `default` template** (`k8s/bases/templates.yaml`) in every release instead of writing hooks
6. **Keep the repo host-agnostic** - the current node happens to be WSL2; don't add WSL-specific config or docs

## File Patterns

When adding a new Helm-managed application, all files live together in one directory:

```
k8s/
├── helmfile.yaml
├── infra/<name>/          # cluster infra (traefik, sealed-secrets)
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
    ├── secret.template.yaml
    └── manifests/         # plain manifests instead of a chart (`chart: ./manifests`)
```

Every release inherits the `default` template from `k8s/bases/templates.yaml`, which applies (only if present, from the release's directory):
- presync: `namespace.yaml`, `sealed-secret*.yaml`
- postsync: `ingress-route.yaml`, `middleware.yaml`

So following the file names above is all the wiring needed. Minimal `release.yaml`:

```yaml
bases:
  - ../../bases/repositories.yaml
  - ../../bases/templates.yaml

releases:
  - name: <app>
    namespace: <app>
    chart: <repo>/<chart>
    version: <version>
    inherit:
      - template: default
    values:
      - values.yaml
```

## Domain Convention

All services use: `<service>.lab.jabed.dev`

## Common Tasks

### Adding a New Application

1. Create namespace manifest
2. Create secret template (for documentation)
3. Generate and seal the actual secret
4. Create Helm values file
5. Create `release.yaml` inheriting the `default` template (picked up by the `apps/*/release.yaml` glob)
6. Create IngressRoute if web-accessible
7. Deploy with `task deploy APP=<app>` (or `helmfile -f k8s/helmfile.yaml -l name=<app> sync`)

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
