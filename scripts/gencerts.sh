#!/bin/bash

function gen_root_cert () {
  kubectl -n $SERVICE_NAMESPACE get secret istio.default -o jsonpath='{.data.root-cert\.pem}' |base64 --decode > certs/root-cert.pem
}

function gen_key () {
  kubectl -n $SERVICE_NAMESPACE get secret istio.default -o jsonpath='{.data.key\.pem}' |base64 --decode > certs/key.pem
}

function gen_cert_chain () {
  kubectl -n $SERVICE_NAMESPACE get secret istio.default -o jsonpath='{.data.cert-chain\.pem}' |base64 --decode > certs/cert-chain.pem
}

gen_root_cert
gen_key
gen_cert_chain
