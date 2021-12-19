# k8s

## 介绍
yaml files for kubernetes

## 安装教程

### ***storage_class:***

```shell
sh ./storage_class/install_local_storage_class.sh

# 然后进入每一个节点执行init_work_nodes.sh
```

申请方法:
```yml
volumeClaimTemplates:
- metadata:
    name: mysql-persistent-storage
spec:
    accessModes: [ "ReadWriteOnce" ]
    storageClassName: "fast-disks"
    resources:
    requests:
        storage: 20Gi
```

### ***基础服务:***
```shell
kubectl apply -f ./infrastructure/namespace.yml
kubectl apply -f ./infrastructure/mysql.yml
kubectl apply -f ./infrastructure/kratos.yml
```
