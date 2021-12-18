#!/bin/sh
# ref: https://blog.csdn.net/weixin_41831919/article/details/118058876

wget https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner/archive/v2.3.4.tar.gz
tar -zxvf v2.3.4.tar.gz

# create storage class.
kubectl create -f ./sig-storage-local-static-provisioner-2.3.4/deployment/kubernetes/example/default_example_storageclass.yaml

# generate template.
helm template ./sig-storage-local-static-provisioner-2.3.4/helm/provisioner > sig-storage-local-static-provisioner-2.3.4/deployment/kubernetes/provisioner_generated.yaml

# deploy provisioner.
kubectl apply -f sig-storage-local-static-provisioner-2.3.4/deployment/kubernetes/provisioner_generated.yaml
