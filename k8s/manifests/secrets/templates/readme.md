```bash
kubeseal --format=yaml --controller-namespace=kube-system \
  --controller-name=sealed-secrets-controller \
  < traefik-dashboard-auth.yaml \
  > sealed-secret-traefik-dashboard-auth.yaml
```