#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# =====================================
# install software packages needed for
# all the other components to run
# =====================================

WORKDIR=/root
TMPDIR=/tmp
cd ${TMPDIR}

echo -e "\n\nSoftware Pre-reqs Installation Starting...\n\n"

# =====================================
# set up the pre-reqs
# =====================================
yum -y update > /dev/null 2>&1
yum -y install \
  ca-certificates \
  cmake \
  curl \
  dialog \
  gnupg \
  groff-base \
  jq \
  less \
  redhat-lsb-core \
  nano \
  python3 \
  python3-pip \
  tzdata \
  unzip \
  vim \
  virtualenv \
  wget

pip3 install virtualenvwrapper

echo -e "\n\nSoftware Pre-reqs Installation Complete!\n\n"
