#author zgyang
#date:2017_09_26
#Deploy ansible on centos7.

export MKROOT = /opt/ikubernetes
export local_ip = ${ip a|egrep "eth1|ens|eno16777736"|grep inet|awk '{print $2}'|awk -F "/" '{print $1}'}

centos = `cat /etc/os-release|grep -i centos`
ubuntu = `cat /etc/os-release|grep -i ubuntu`


.PHONY: master node

install_ansible:
	@if centos ;then  yum install -y ansible;else apt install -y ansible;fi





copyfile:
	@cp ${MKROOT}/ansible/files/hosts /etc/ansible/hosts



deploy:
	make install_ansible
	make copyfile

clean:
	@yum  remove -y ansible || apt remove -y ansible
	@rm -rf /etc/ansible/hosts


help:
	@echo "Use age：make deploy or make clean"

