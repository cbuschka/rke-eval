#!/bin/bash
  
PROJECT_DIR=$(cd `dirname $0` && pwd)
cd ${PROJECT_DIR}

source ${PROJECT_DIR}/configrc

export KUBECONFIG=${PWD}/kube_config_cluster.yml
rm -f ${KUBECONFIG}
./rke util get-kubeconfig

kubectl proxy