# Twingate Connector Setup

This directory contains the Helmfile configuration for deploying the Twingate connector to Kubernetes.

## Components

- **values.yaml**: Helm values configuration for the Twingate connector
- **release.yaml**: Helmfile release definition
- **release.lock**: Helmfile lock file

## Configuration

The connector is configured with:
- Network: `jabed`
- Namespace: `twingate`
- Sealed Secrets for credential management

## Credentials

Credentials are stored as sealed secrets in:
- `k8s/manifests/secrets/sealed-secrets/twingate-connector-credentials.yaml`

The secret contains:
- `TWINGATE_ACCESS_TOKEN`: Access token for the connector
- `TWINGATE_REFRESH_TOKEN`: Refresh token for the connector

## Deployment

To deploy or update the Twingate connector:

```bash
cd /home/admin/ops/k8s
helmfile sync -f releases/twingate/release.yaml
```

## Updating Credentials

If you need to update the access and refresh tokens:

1. Create a new Kubernetes secret (dry-run):
```bash
kubectl create secret generic twingate-connector-credentials \
  --from-literal=TWINGATE_ACCESS_TOKEN='YOUR_NEW_ACCESS_TOKEN' \
  --from-literal=TWINGATE_REFRESH_TOKEN='YOUR_NEW_REFRESH_TOKEN' \
  --namespace=twingate \
  --dry-run=client -o yaml > /tmp/twingate-secret.yaml
```

2. Seal the secret:
```bash
kubeseal --format=yaml \
  --controller-name=sealed-secrets \
  --controller-namespace=sealed-secrets \
  < /tmp/twingate-secret.yaml \
  > k8s/manifests/secrets/sealed-secrets/twingate-connector-credentials.yaml
```

3. Apply the sealed secret:
```bash
kubectl apply -f k8s/manifests/secrets/sealed-secrets/twingate-connector-credentials.yaml
```

4. Restart the connector to pick up new credentials:
```bash
kubectl rollout restart deployment twingate-connector -n twingate
```

## Monitoring

Check connector status:
```bash
# View pods
kubectl get pods -n twingate

# View logs
kubectl logs -n twingate -l app.kubernetes.io/name=connector

# Check connector health
kubectl exec -n twingate deployment/twingate-connector -- /connectorctl health
```

## Troubleshooting

### Authentication Errors

If you see "State: Error" in the logs, it usually means:
- The access token has expired - Generate new tokens from the Twingate Admin Console
- The refresh token is invalid
- Network connectivity issues

To fix:
1. Get new tokens from: https://jabed.twingate.com/connectors
2. Update the sealed secret (see "Updating Credentials" above)
3. Restart the deployment

### Token Expiration

The access token shown in the initial setup has these details:
- Issued: December 12, 2025 (epoch: 1765497516)
- Expires: December 12, 2025 (epoch: 1765501116) - approximately 1 hour validity
- Network: jabed
- Device ID: 2747489

**Note**: Access tokens typically expire after a short period. The refresh token should be used to obtain new access tokens automatically by the connector. If authentication continues to fail, regenerate both tokens from the Twingate console.

## Getting New Tokens

1. Log into Twingate Admin Console: https://jabed.twingate.com
2. Navigate to: Settings > Networks > Connectors
3. Click "Generate Tokens" for your connector
4. Copy the new access token and refresh token
5. Update the sealed secret using the commands above
