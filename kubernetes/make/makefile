#!/bin/bash
#author zgyang
#date:2017_09_26
#init centos7

export MKROOT = /opt/ikubernetes
export K8SROOT = /opt/ikubernetes/kubernetes
export local_ip = ${ip a|egrep "eth1|ens"|grep inet|awk '{print $2}'|awk -F "/" '{print $1}'}
export images=(kube-controller-manager-amd64 etcd-amd64 k8s-dns-sidecar-amd64 kube-proxy-amd64 kube-apiserver-amd64 kube-scheduler-amd64 pause-amd64 k8s-dns-dnsmasq-nanny-amd64 k8s-dns-kube-dns-amd64)


.PHONY: master node

init:
	cp $(K8SROOT)/repo/kubernetes.repo /etc/yum.repos.d/
	swapoff -a && sed -i '/swap/d' /etc/fstab
	/usr/local/bin/proxychains4 yum install -y kubelet-1.8.4-0 kubeadm-1.8.4-0 kubectl-1.8.4-0
	sed -i "s/systemd/cgroupfs/g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
	systemctl daemon-reload && systemctl restart kubelet && systemctl enable kubelet.service
	echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables

getimages:
	for imageName in ${images[@]} ; do ;docker pull champly/${imageName} ;docker tag champly/${imageName} gcr.io/google_containers/${imageName} ;docker rmi champly/${imageName} ;done


k8smdeploy:
	kubeadm reset && kubeadm init --apiserver-advertise-address ${local_ip} --pod-network-cidr=10.244.0.0/16
	mkdir -p ${HOME}/.kube
	cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
	chown $(id -u):$(id -g) $HOME/.kube/config
	export KUBECONFIG=/etc/kubernetes/kubelet.conf
	kubectl apply -f  $(K8SROOT)/files/kube-flannel.yml
	iptables -P FORWARD ACCEPT

k8ssdeploy:

	iptables -P FORWARD ACCEPT
	echo " Use：  kubeadm join --token  "



master:
	make init
	make getimages
	make k8smdeploy




node:
	make init
	make getimages
	make k8ssdeploy

clean:
	kubeadm reset
	yum -y remove kubeadm kubectl kubelet


help:
	echo "Use age：make master or make node"

