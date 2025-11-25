1. Add the Traefik Helm repository and update your local Helm chart repository cache:

```bash
helm repo add traefik https://traefik.github.io/charts
helm repo update
```

2. Install Traefik using Helm with the specified values file:

```bash
helm install traefik traefik/traefik \
  --namespace traefik \
  --values helm/values/traefik/values.yaml 
```

3. After any changes to the values file, upgrade the Traefik installation:

```bash
helm upgrade traefik traefik/traefik \
  --namespace traefik \
  --values helm/values/traefik/values.yaml
```

---

1. Add the MetalLB Helm repository and update your local Helm chart repository cache:

```bash
helm repo add metallb https://metallb.github.io/metallb
helm repo update
```

2. Install MetalLB using Helm with the specified values file:

```bash
helm install metallb metallb/metallb \
  --namespace metallb\
  --create-namespace
```
