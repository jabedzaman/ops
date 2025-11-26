# Whoami Application

A simple demonstration application that displays HTTP request information.

## Overview

This deploys the `traefik/whoami` container, which returns details about the HTTP request it receives. Useful for testing ingress configurations and routing.

## Files

- `deployment.yaml`: Kubernetes deployment for the whoami app
- `service.yaml`: Service to expose the deployment
- `ingress-route.yaml`: Traefik IngressRoute for routing to `whoami.zaman.lol`

## Deployment

```bash
kubectl apply -f .
```

## Access

Once deployed, access the application at `https://whoami.zaman.lol` (requires DNS and TLS certificate resolver configured).