#author zgyang
#date:2017_09_26
#Deploy ansible on centos7.

export MKROOT = /opt/ikubernetes
export centos = ${cat /etc/os-release|grep -i 'centos'}
export ubuntu = ${cat /etc/os-release|grep -i 'ubuntu'}


install_ansible:
	if  [ ${centos} = "CentOS" ] ;then  yum install -y ansible ;else apt install -y ansible ;fi





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

