```bash
helm repo add traefik https://traefik.github.io/charts
helm repo update
```

```bash
helm install traefik traefik/traefik \
  --namespace traefik \
  --values helm/values/traefik/values.yaml 
```