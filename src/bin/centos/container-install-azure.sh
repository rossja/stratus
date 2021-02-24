#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# =====================================
# install the Azure CLI Tools
# =====================================

WORKDIR=/root
TMPDIR=/tmp
cd ${TMPDIR}

echo -e "\n\nAzure CLI Installation Starting...\n\n"

# blackbox pipe a random URL directly to shell
# why? because MSFT
#curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# manual process

# add msft gpg key to yum
rpm --import https://packages.microsoft.com/keys/microsoft.asc

# create the local repo info
echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo


# install the software
yum -y install azure-cli

echo -e "\n\nAzure CLI Installation Complete!\n\n"
