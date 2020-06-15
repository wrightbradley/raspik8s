#!/bin/bash

curl -s "https://raw.githubusercontent.com/\
kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

sudo mv kustomize /usr/local/bin/kustomize
sudo chmod +x /usr/local/bin/kustomize
