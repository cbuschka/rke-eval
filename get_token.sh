#!/bin/bash
  
PROJECT_DIR=$(cd `dirname $0` && pwd)
cd ${PROJECT_DIR}

source ${PROJECT_DIR}/configrc

export KUBECONFIG=${PWD}/kube_config_cluster.yml
rm -f ${KUBECONFIG}
./rke util get-kubeconfig

echo "Username: admin"
echo "Token: $(kubectl -n kubernetes-dashboard describe secret admin-user-token | grep ^token | perl -pe 's#^.*token\:\s*([^\s\n]+).*$#$1#g')"
