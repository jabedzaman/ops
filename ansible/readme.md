# Ansible Operations

This directory contains Ansible playbooks and related files used for automating various operations tasks. This helps to reproduce the same configurations across multiple hosts efficiently.

## Structure

- `playbooks/`: Contains Ansible playbooks for different operations.
- `playbooks/files/`: Contains files used by the playbooks.
- `inventories/`: Contains inventory files defining the hosts and groups.
- `configure.yml`: Main playbook to configure systems.
- `setup.sh`: Script to install Ansible and required dependencies.

## Playbooks

- `setup_git.yml`: Sets up Git on the target machines.
- `setup_k3s.yml`: Installs and configures K3s along with kubectl.
- `setup_ssh.yml`: Configures SSH for passwordless access.
- `setup_ufw.yml`: Configures UFW firewall settings.

## Install Ansible

```bash
./setup.sh
```

## Usage

To run all playbooks:

```bash
ansible-playbook -i inventories/hosts -K configure.yml
```

To run a specific playbook, use:

```bash
ansible-playbook -i inventories/hosts -K playbooks/<playbook_name>.yml
```

### Extending SSH Access

To add or update SSH public keys for login access, modify the `files/authorized_keys` file and re-run the `setup_ssh.yml` playbook



