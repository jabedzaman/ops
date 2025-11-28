# Secret Templates

Templates for creating Kubernetes secrets that will be sealed using kubeseal.

## Files

- `traefik-dashboard-auth.template.yaml`: Template for Traefik dashboard authentication secret

## Generating Sealed Secrets

To create a sealed secret from the template:

```bash
kubeseal --format=yaml --controller-namespace=kube-system \
  --controller-name=sealed-secrets-controller \
  < traefik-dashboard-auth.yaml \
  > ../sealed-secrets/sealed-secret-traefik-dashboard-auth.yaml
```

## Notes

Edit the template files with actual secret values, then seal them before committing to Git.
