# Kubernetes Operations

This directory contains Kubernetes configurations and deployments managed using Helmfile, Helm charts, and static manifests.

## Overview

The setup includes:
- **Traefik**: Ingress controller and load balancer
- **MetalLB**: Load balancer for bare-metal Kubernetes clusters
- **Sealed Secrets**: Controller for managing encrypted secrets
- **Longhorn**: Distributed block storage for Kubernetes

## Structure

- `helmfile.yaml`: Main Helmfile configuration defining repositories and releases
- `apps/`: Application-specific Kubernetes manifests
- `helm/`: Helm chart values and configurations
- `manifests/`: Static Kubernetes manifests (namespaces, secrets)
- `middleware/`: Traefik middleware configurations

## Chart Deployments

Helmfile is used to deploy and manage all Helm charts.

To synchronize and apply the configurations, run:

```bash
helmfile sync
```

And to apply the configurations, run:

```bash
helmfile apply
```

