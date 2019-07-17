#!/bin/bash

function clear_env_file () {
  [ -e $1 ] && rm $1
}

function gen_local_env () {
  GWIP=$(kubectl get -n istio-system service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  echo "GWIP=$GWIP" >> scripts/local.env
}

function gen_cluster_env () {
  ISTIO_SERVICE_CIDR=$(gcloud container clusters describe $K8S_CLUSTER --zone $MY_ZONE --project $MY_PROJECT --format "value(servicesIpv4Cidr)")
  echo "ISTIO_SERVICE_CIDR=$ISTIO_SERVICE_CIDR" >> scripts/cluster.env
  echo "ISTIO_CP_AUTH=MUTUAL_TLS" >> scripts/cluster.env
}

clear_env_file scripts/local.env
clear_env_file scripts/cluster.env
gen_local_env
gen_cluster_env
