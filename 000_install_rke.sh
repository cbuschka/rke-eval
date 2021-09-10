#!/bin/bash

set -e

PROJECT_DIR=$(cd `dirname $0` && pwd)
cd ${PROJECT_DIR}

source ${PROJECT_DIR}/configrc

if [ ! -f k3d-${RKE_VERSION} ]; then
  echo "Downloading rke ${RKE_VERSION}..."
  curl -L https://github.com/rancher/rke/releases/download/${RKE_VERSION}/rke_linux-amd64 -o rke-${RKE_VERSION}
fi

rm -f rke
ln -s rke-${RKE_VERSION} rke
chmod 755 rke-${RKE_VERSION}
