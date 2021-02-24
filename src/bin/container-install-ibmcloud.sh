#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# =====================================
# install IBM Cloud CLI
# =====================================

WORKDIR=/root
TMPDIR=/tmp
IBMDIR=/root/.bluemix

echo -e "\n\nIBM Cloud CLI Installation Starting...\n\n"

cd ${TMPDIR}
curl "https://download.clis.cloud.ibm.com/ibm-cloud-cli/1.2.3/IBM_Cloud_CLI_1.2.3_amd64.tar.gz" -o "ibmcli.tgz"
tar xvf ibmcli.tgz
cd ${TMPDIR}/Bluemix_CLI
./install


# install common CLI plugins
plugins=(\
"catalogs-management" \
"cloud-databases" \
"cloud-dns-services" \
"cloud-functions" \
"cloud-object-storage" \
"container-registry" \
"container-service" \
"doi" \
"key-protect" \
"observe-service" \
"push-notifications" \
"vpc-infrastructure" \
)

for plugin in ${plugins[@]}; do
  echo -e "Installing plugin: ${plugin}"
  ibmcloud plugin install ${plugin} -f
done
