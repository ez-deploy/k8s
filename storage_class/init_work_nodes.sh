#!/bin/sh
# run in each work node.

for i in $(seq 1 10); do
  mkdir -p /mnt/fast-disks-bind/vol${i}
  mkdir -p /mnt/fast-disks/vol${i}
  mount --bind /mnt/fast-disks-bind/vol${i} /mnt/fast-disks/vol${i}
done

# 配置/etc/fstab永久挂载
for i in $(seq 1 10); do
  echo /mnt/fast-disks-bind/vol${i} /mnt/fast-disks/vol${i} none bind 0 0 | sudo tee -a /etc/fstab
done