# MariaDB Kubernetes Deployment

This directory contains Kubernetes manifests for deploying MariaDB using the official Docker image with Longhorn persistent storage.

## Components

| File | Description |
|------|-------------|
| `statefulset.yaml` | MariaDB StatefulSet with Longhorn PVC |
| `service.yaml` | ClusterIP service for MariaDB |
| `configmap.yaml` | MariaDB configuration |

## Prerequisites

- Namespace: `mariadb` (created via `manifests/namespaces/mariadb.yaml`)
- Secret: `mariadb-credentials` (sealed secret with `mariadb-root-password` and `mariadb-password`)
- StorageClass: `longhorn`

## Deployment

```bash
# Apply namespace first
kubectl apply -f ../../manifests/namespaces/mariadb.yaml

# Apply sealed secret
kubectl apply -f ../../manifests/secrets/sealed-secrets/sealed-secret-mariadb-credentials.yaml

# Deploy MariaDB
kubectl apply -f .
```

## Connection Details

- **Host:** `mariadb.mariadb.svc.cluster.local`
- **Port:** `3306`
- **Root Password:** Stored in `mariadb-credentials` secret
