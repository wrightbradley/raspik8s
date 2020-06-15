#!/bin/bash

helm install --set nfs.server=192.168.1.200 --set nfs.path=/mnt/sda1/k8s --set image.repository=quay.io/external_storage/nfs-client-provisioner-arm nfs-client stable/nfs-client-provisioner

kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
