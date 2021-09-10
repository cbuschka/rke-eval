#!/bin/bash

set -e
  
PROJECT_DIR=$(cd `dirname $0` && pwd)
cd ${PROJECT_DIR}

source ${PROJECT_DIR}/configrc

export KUBECONFIG=${PWD}/kube_config_cluster.yml
rm -f ${KUBECONFIG}
./rke util get-kubeconfig

echo "rke version: ${RKE_VERSION}"

echo "rke docker containers..."
docker ps | grep rke

echo "Cluster info..."
kubectl cluster-info

echo "Nodes of cluster ${CLUSTER_NAME}..."
kubectl get nodes

echo "Namespaces of cluster ${CLUSTER_NAME}..."
kubectl get namespaces

echo "Pods in cluster ${CLUSTER_NAME}..."
kubectl get pods --all-namespaces

echo "Ingresses of cluster ${CLUSTER_NAME}..."
kubectl get ingresses --all-namespaces
