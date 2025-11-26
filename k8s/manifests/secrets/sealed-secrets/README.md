# Sealed Secrets

Encrypted secret manifests created using kubeseal.

## Files

- `sealed-secret-traefik-dashboard-auth.yaml`: Sealed secret for Traefik dashboard authentication

## Deployment

```bash
kubectl apply -f .
```

These secrets are decrypted by the Sealed Secrets controller at runtime.