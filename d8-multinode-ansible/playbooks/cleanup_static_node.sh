#!/bin/bash

if [ -z $1 ] || [ "$1" != "--yes-i-am-sane-and-i-understand-what-i-am-doing" ];  then
  >&2 echo "Needed flag isn't passed, exit without any action (--yes-i-am-sane-and-i-understand-what-i-am-doing)"
  exit 1
fi

systemctl disable bashible.service bashible.timer
systemctl stop bashible.service bashible.timer
for pid in $(ps ax | grep "bash /var/lib/bashible/bashible" | grep -v grep | awk '{print $1}'); do
  kill $pid
done

systemctl disable sysctl-tuner.service sysctl-tuner.timer
systemctl disable old-csi-mount-cleaner.service old-csi-mount-cleaner.timer
systemctl disable d8-containerd-cgroup-migration.service
systemctl disable containerd-deckhouse.service
systemctl disable kubelet.service

systemctl stop sysctl-tuner.service sysctl-tuner.timer
systemctl stop old-csi-mount-cleaner.service old-csi-mount-cleaner.timer
systemctl stop d8-containerd-cgroup-migration.service
systemctl stop containerd-deckhouse.service
systemctl stop kubelet.service

# `killall` needs `psmisc` package
# `pkill` needs `procps` on debian-like systems and `procps-ng` on centos-like
# looks like procps(-ng) already installed by default in systems
# killall /opt/deckhouse/bin/containerd-shim-runc-v2
pkill containerd-shim

for i in $(mount -t tmpfs | grep /var/lib/kubelet | cut -d " " -f3); do umount $i ; done

rm -rf /etc/systemd/system/bashible.*
rm -rf /etc/systemd/system/sysctl-tuner.*
rm -rf /etc/systemd/system/old-csi-mount-cleaner.*
rm -rf /etc/systemd/system/d8-containerd-cgroup-migration.*
rm -rf /etc/systemd/system/containerd-deckhouse.service /etc/systemd/system/containerd-deckhouse.service.d /lib/systemd/system/containerd-deckhouse.service
rm -rf /etc/systemd/system/kubelet.service /etc/systemd/system/kubelet.service.d /lib/systemd/system/kubelet.service

systemctl daemon-reload

rm -rf /var/cache/registrypackages
rm -rf /etc/kubernetes
rm -rf /var/lib/kubelet
rm -rf /var/lib/containerd
rm -rf /etc/cni
rm -rf /var/lib/cni
rm -rf /var/lib/etcd
rm -rf /opt/cni
rm -rf /opt/deckhouse
rm -rf /var/lib/bashible
rm -rf /etc/containerd
rm -rf /var/log/kube-audit
rm -rf /var/log/pods
rm -rf /var/log/containers
rm -rf /var/lib/deckhouse
rm -rf /var/lib/upmeter
rm -rf /etc/sudoers.d/sudoers_flant_kubectl
rm -rf /etc/sudoers.d/30-deckhouse-nodeadmins

shutdown -r -t 5
