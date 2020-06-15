#!/bin/bash

sudo apt install nfs-kernel-server
sudo systemctl start nfs-kernel-server.service

sudo cp ./exports /etc/exports
sudo chmod 600 /etc/exports

sudo mkdir -p /mnt/path
sudo chown nobody:nogroup /mnt/path
sudo exportfs -av

sudo systemctl restart nfs-kernel-server.service

kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
kubectl patch storageclass managed-nfs-storage -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

