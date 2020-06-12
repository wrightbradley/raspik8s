#!/bin/bash

wget https://github.com/ahmetb/kubectx/releases/download/v0.9.0/kubectx_v0.9.0_linux_x86_64.tar.gz
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.0/kubens_v0.9.0_linux_x86_64.tar.gz

tar -xzvf kubectx_v0.9.0_linux_x86_64.tar.gz
tar -xzvf kubens_v0.9.0_linux_x86_64.tar.gz

sudo mv kubectx /usr/local/bin/
sudo mv kubens /usr/local/bin/
sudo chmod +x /usr/local/bin/kubectx
sudo chmod +x /usr/local/bin/kubens

mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions
ln -sf /opt/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
ln -sf /opt/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh

rm -rf kubectx_v0.9.0_linux_x86_64.tar.gz
rm -rf kubens_v0.9.0_linux_x86_64.tar.gz
rm LICENSE
