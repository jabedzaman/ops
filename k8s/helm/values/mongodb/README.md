# MongoDB Helm Values

This directory contains custom Helm values for the MongoDB Community Operator deployment.

## Files

- `values.yaml` - Operator configuration and resource limits

## Usage

Referenced automatically by helmfile when syncing the mongodb release.

```bash
helmfile -l name=mongodb sync
```

## Configuration

The values configure:
- Operator resource limits
- Operator deployment settings

The actual MongoDB instance (with PVC and storage configuration) is deployed separately via the MongoDBCommunity custom resource in `k8s/apps/mongodb/`.
