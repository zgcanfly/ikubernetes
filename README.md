# overview

##    使用ansible部署kubernetes项目
###### 注:
	     1. 适用于开发环境 不建议直接上生产环境,如需使用 请自行修改文件
	     2. 本项目部署镜像均采用谷歌服务器镜像没有经过tag 方式 ，部署时请保证服务器可以访问google服务器
	     3. 部署机器为 CentOS7, Ubuntu将后续支持
	            欢迎加入QQ群聊一起讨论Devops技术: 540085853


####   使用帮助:
		1. 项目目录需要放在/opt 目录; cd /opt && git clone https://github.com/zgcanfly/ikubernetes.git
		2. 需提前在ansible主机配置好ssh 无秘钥登入所有集群
		3. vim /opt/ikubernetes/ansible/files/hosts    rewiret k8s_master机器
		4. cd /opt/ikubernetes/ansible/ansible-playbook/develop/ansible-deploy && make deploy 即可部署ansible


		5. cd /opt/ikubernetes/ansible/ansible-playbook/develop/init && ansible-playbook main.yaml
		6. cd /opt/ikubernetes/ansible/ansible-playbook/develop/docker && ansible-playbook main.yaml
		7. cd /opt/ikubernetes/ansible/ansible-playbook/develop/ntpsync && ansible-playbook main.yaml
		8. cd /opt/ikubernetes/ansible/ansible-playbook/develop/clean && ansible-playbook main.yaml
		9. cd /opt/ikubernetes/ansible/ansible-playbook/develop/kubernetes && ansible-playbook main.yaml
		10. cd /opt/ikubernetes/ansible/ansible-playbook/develop/kubernetes && cat deploy.log |grep "join"  查看kubernetes join 登入node节点执行
		11. 登入k8s-master && kubectl get node ;完成部署



**目录介绍:**
###### 注:
            1. /opt/ikubernetes/ansible/ansible-playbook/develop/ansible-deploy  完成ansible部署
            2. /opt/ikubernetes/ansible/ansible-playbook/develop/init  完成所有机器的环境部署
            3. /opt/ikubernetes/ansible/ansible-playbook/develop/docker  完成所有机器docker部署
            4. /opt/ikubernetes/ansible/ansible-playbook/develop/clean  完成所有机器获取本项目到目标机器
            5. /opt/ikubernetes/ansible/ansible-playbook/develop/ntpsynv  完成所有机器的时间同步
            6. /opt/ikubernetes/ansible/ansible-playbook/develop/kubernetes  完成master和node节点的部署
