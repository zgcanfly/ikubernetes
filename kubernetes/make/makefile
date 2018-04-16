#!/bin/bash
#author zgyang
#date:2017_09_26
#init centos7

export MKROOT = /opt/sg_deploy
export K8SROOT = /opt/sg_deploy/kubernetes
export local_ip = ${ip a|egrep "eth1|ens"|grep inet|awk '{print $2}'|awk -F "/" '{print $1}'}


.PHONY: master node

init:
	$(MKROOT)/deployer/tools/init7.sh
	cp $(K8SROOT)/repo/kubernetes.repo /etc/yum.repos.d/
	yum install -y kubeadm kubelet
	sed -i "s/systemd/cgroupfs/g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf



downnode:
	$(MKROOT)/docker/turnimg.sh $(K8SROOT)/files/node.txt

downmaster:
	$(MKROOT)/docker/turnimg.sh $(K8SROOT)/files/master.txt

k8smdeploy:
	kubeadm init --apiserver-advertise-address ${local_ip} --pod-network-cidr 10.244.0.0/16
	mkdir -p ${HOME}/.kube
	cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
	chown $(id -u):$(id -g) $HOME/.kube/config
	export KUBECONFIG=/etc/kubernetes/kubelet.conf
	kubectl apply -f  $(K8SROOT)/files/kube-flannel.yml
	iptables -P FORWARD ACCEPT

k8ssdeploy:
	echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
	iptables -P FORWARD ACCEPT
	echo " Use：  kubeadm join --token  "



master:
	make init
	make downmaster
	make k8smdeploy




node:
	make init
	make downnode
	make k8ssdeploy

help:
	echo "Use age：make master or make node"

