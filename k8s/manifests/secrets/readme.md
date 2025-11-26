```bash
kubeseal --format=yaml --controller-namespace=kube-system \
  --controller-name=sealed-secrets-controller \
  < cloudflare-secret.yaml \
  > sealed-secret-cloudflare-api-token.yaml
```

```bash
kubeseal --format=yaml --controller-namespace=sealed-secrets \
     --controller-name=sealed-secrets \
     < traefik-dashboard-auth.yaml > \
     sealed-secret-traefik-dashboard-auth.yaml
```


