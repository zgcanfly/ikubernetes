#!/bin/bash
#author zgyang
#date:2017_09_26
#Deploy kubernetes on centos7.

export MKROOT = /opt/ikubernetes
export K8SROOT = /opt/ikubernetes/kubernetes
export local_ip = ${ip a|egrep "eth1|ens|eno16777736"|grep inet|awk '{print $2}'|awk -F "/" '{print $1}'}


.PHONY: master node

init:
	cp $(K8SROOT)/repo/kubernetes.repo /etc/yum.repos.d/
	swapoff -a && sed -i '/swap/d' /etc/fstab
	yum install -y kubelet kubeadm kubectl
	sed -i "s/systemd/cgroupfs/g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
	systemctl daemon-reload && systemctl restart kubelet && systemctl enable kubelet.service
	echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
#	docker pull k8s.gcr.io/kube-apiserver-amd64:v1.10.1
#	docker pull k8s.gcr.io/kube-controller-manager-amd64:v1.10.1
#	docker pull k8s.gcr.io/kube-scheduler-amd64:v1.10.1
#	docker pull k8s.gcr.io/etcd-amd64:3.1.12



deploymaster:
	kubeadm reset && kubeadm init  --token-ttl 0 --apiserver-advertise-address=${local_ip}  --pod-network-cidr=10.244.0.0/16
	mkdir -p ${HOME}/.kube
	\cp -f /etc/kubernetes/admin.conf $(HOME)/.kube/config
	chown $(id -u):$(id -g) $(HOME)/.kube/config
	export KUBECONFIG=/etc/kubernetes/kubelet.conf
	kubectl apply -f  $(K8SROOT)/files/kube-flannel.yaml
	iptables -P FORWARD ACCEPT

deployUI:
	kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
#	kubectl apply -f  $(K8SROOT)/files/kube-dashboard-access.yaml
#	kubectl proxy --address=${local_ip} --accept-hosts='^*$' &
	echo " 访问仪表盘URL: http://masterip:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy"

deploynode:

	iptables -P FORWARD ACCEPT
	echo " Use：  kubeadm join --token  "



master:
	make init
	make deploymaster
	make deployUI




node:
	make init
	make deploynode

clean:
	kubeadm reset
	yum -y remove kubeadm kubectl kubelet


help:
	echo "Use age：make master or make node"

