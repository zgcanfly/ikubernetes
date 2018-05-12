#author zgyang
#date:2017_09_26
#Deploy ansible on Centos7 or Ubuntu.

export MKROOT = /opt/ikubernetes


install_ansible:
	yum install -y ansible || apt install -y ansible

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

