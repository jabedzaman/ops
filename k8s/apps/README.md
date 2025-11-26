# Applications

This directory contains Kubernetes manifests for deploying applications on the cluster.

## Structure

- `whoami/`: Simple whoami application for testing ingress and routing

## Deployment

Apply the manifests for each application:

```bash
kubectl apply -f whoami/
```

Or use Helmfile if integrated.