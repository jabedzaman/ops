# Secrets Management

This directory contains Sealed Secrets manifests and templates for managing encrypted secrets in Kubernetes.

## Overview

Uses Bitnami Sealed Secrets to encrypt secrets before storing them in Git. The controller decrypts them at runtime.

## Structure

- `sealed-secrets/`: Sealed secret manifests
- `templates/`: Secret templates and generation scripts

## Sealing Secrets

To seal a secret using kubeseal:

```bash
kubeseal --format=yaml --controller-namespace=sealed-secrets \
     --controller-name=sealed-secrets \
     < traefik-dashboard-auth.yaml > \
     sealed-secret-traefik-dashboard-auth.yaml
```


