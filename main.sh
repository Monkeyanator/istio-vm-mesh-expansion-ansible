#!/usr/bin/env bash
# This file:
#
#  - Automates Istio mesh expansion for VMs
#
# Usage:
#
#  ./istio-mesh-expand.sh --ip 35.129.128.522 --ports {8080,9000} --namespace foo

set -o errexit
set -o nounset
set -o pipefail

# set needed local envvars
sh scripts/make_env.sh
source scripts/local.env # THIS DOES NOT WORK

# gen certs and move to /certs
sh scripts/gencerts.sh

ansible-playbook -i hosts playbook.yaml
