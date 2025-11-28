# Security Policy

## Reporting Security Vulnerabilities

Thank you for helping keep this infrastructure secure. If you discover a security vulnerability, please follow the responsible disclosure guidelines below.

### Important: Do NOT Create Public Issues

**Please do not report security vulnerabilities through public GitHub issues, discussions, or pull requests.**

Creating a public issue for security vulnerabilities can:
- Expose the vulnerability to malicious actors before it's fixed
- Put the infrastructure and its users at risk
- Cause unintended damage to production systems

### How to Report

Please report security vulnerabilities by emailing:

**[hi@jabed.dev](mailto:hi@jabed.dev)**

Include the following information in your report:

1. **Description** - A clear description of the vulnerability
2. **Location** - The affected file(s), configuration(s), or component(s)
3. **Impact** - Potential impact of the vulnerability
4. **Reproduction Steps** - Step-by-step instructions to reproduce the issue
5. **Suggested Fix** - (Optional) If you have a suggested remediation

### What to Expect

- **Acknowledgment**: You will receive an acknowledgment within 48 hours
- **Updates**: Regular updates on the progress of addressing the vulnerability
- **Resolution**: Notification when the vulnerability has been fixed
- **Credit**: Attribution in the fix (if desired) after the vulnerability is resolved

### Scope

This security policy applies to:

- Kubernetes manifests and configurations in `k8s/`
- Ansible playbooks and configurations in `ansible/`
- GitHub Actions workflows in `.github/`
- Any exposed secrets or credentials
- Infrastructure misconfigurations

### Out of Scope

- Vulnerabilities in third-party Helm charts (report to upstream maintainers)
- Vulnerabilities in K3s, Traefik, Longhorn, etc. (report to respective projects)
- Issues that require physical access to the infrastructure

## Security Best Practices in This Repository

This repository follows these security practices:

1. **Sealed Secrets** - All Kubernetes secrets are encrypted using Bitnami Sealed Secrets
2. **No Plaintext Credentials** - Secret templates contain placeholders only
3. **Least Privilege** - RBAC and service accounts follow least privilege principles
4. **TLS Everywhere** - All external endpoints use TLS via Let's Encrypt/Cloudflare

## Contact

For security concerns: **hi@jabed.dev**

For general questions: Open a GitHub issue or discussion
