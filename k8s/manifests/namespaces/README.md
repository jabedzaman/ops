# Namespaces

Static namespace definitions for Kubernetes components.

## Namespaces

- `metallb.yaml`: Namespace for MetalLB load balancer
- `traefik.yaml`: Namespace for Traefik ingress controller

## Deployment

```bash
kubectl apply -f .
```

Note: Some namespaces may be created automatically by Helm releases.