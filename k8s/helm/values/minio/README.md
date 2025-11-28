# MinIO Helm Values

This directory contains the Helm values for MinIO deployment.

## Configuration

- **Storage**: Uses Longhorn StorageClass for persistent storage (50Gi)
- **Mode**: Standalone (single server)
- **Credentials**: Stored in sealed secret `minio-credentials` in the `minio` namespace

## Secrets

The MinIO root credentials are stored in a sealed secret. The secret contains:
- `rootUser`: MinIO admin username
- `rootPassword`: MinIO admin password

## Accessing MinIO

MinIO exposes two ports:
- **9000**: S3 API endpoint
- **9001**: Console (Web UI)

Access can be configured via Traefik IngressRoute if needed.
