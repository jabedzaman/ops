# MetalLB Values

Helm values for deploying MetalLB, a load balancer for bare-metal Kubernetes clusters.

## Configuration

Defines an IP address pool and L2 advertisement for load balancer services.

- **IP Pool**: `10.0.0.171/32` (single IP, adjust for your network)
- **Advertisement**: L2 advertisement for the defined pool

## Notes

Update the IP address to match your network configuration before deploying.