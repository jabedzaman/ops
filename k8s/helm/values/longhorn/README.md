# Longhorn Values

Helm values for deploying Longhorn, a distributed block storage system for Kubernetes.

## Configuration

- Disables usage metrics collection
- Sets storage over-provisioning to 100%

## Deployment

Managed via Helmfile. Changes to this file require re-applying the Helmfile.