#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Setting up Ansible environment...${NC}"

# update the package list
sudo apt-get update

# install software-properties-common package (used to manage PPAs)
sudo apt-get install -y software-properties-common

# add ansible PPA
sudo add-apt-repository --yes --update ppa:ansible/ansible

# install ansible
sudo apt-get install -y ansible

# verify ansible installation
if command -v ansible >/dev/null 2>&1; then
    echo -e "${GREEN}Ansible installed successfully! Version: $(ansible --version | head -n 1)${NC}"
else
    echo -e "${RED}Ansible installation failed.${NC}"
    exit 1
fi