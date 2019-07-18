# Ansible playbook to bring VM fleets into Istio mesh

> Istio is hard, incorporating VMs shouldn't be


## Overview
This project aims to provide a customizable Ansible playbook and wrapper scripts to bring existing VMs into an Istio mesh. Most features are broken as of now, and this is mostly experimental.

## Goals
A sufficient _this project has accomplished what I hoped it would_ point for me would be to have a well-defined variable list for each host group that users can use to describe what's running on the machine, and expose it in their cluster. This might look like:

```
[global:vars]
INGRESS_GW=12.34.45.56
ISTIO_SERVICE_CIDR=12.34.56.78

[mysql]
12.34.56.78
23.45.67.89
...

[mysql:vars]
PORTS=123,234

[recommendation-vms]
12.34.56.78
23.45.67.89

[recommendation-vms:vars]
PORTS=8080
...

```

The question is whether this tool should extend to creating `ServiceEntry`s and running `istioctl register`, or if that is out of scope (i.e. it should stop at provisioning the VMs). I'm leaning towards saying that would be nice to have.

Another goal is to keep this vendor-agnostic, tested on all VM providers, including testing cross-cloud.

## Installation
`git clone https://github.com/Monkeyanator/istio-vm-mesh-expansion-ansible`

## Usage

First, create a `hosts` file and drop it in the root of the project. Transfer `ssh` public keys into `authorized_keys` on all hosts and put the host names / IPS in the `hosts` file (so, standard Ansible stuff).

To kick things off, run:

`. ./main.sh`

This will generate needed certificates and `.env` files, and kick off the Ansible steps. Note that the steps are taken straight off the page for mesh expansion [from the Istio docs](https://istio.io/docs/setup/kubernetes/additional-setup/mesh-expansion/).            


## Contributing
Drop in issues and PRs :)
