# Static Manifests

This directory contains static Kubernetes manifests that are not managed by Helm.

## Structure

- `namespaces/`: Namespace definitions
- `secrets/`: Sealed Secrets and secret templates

## Deployment

Apply manifests using kubectl:

```bash
kubectl apply -f namespaces/
kubectl apply -f secrets/
```