# overview

##    使用ansible部署kubernetes项目
	  注 1.适用于开发环境 不建议直接上生产环境,如需使用 请自行修改文件
	     2.本项目部署镜像均采用谷歌服务器镜像没有经过tag 方式 ，部署时请保证服务器可以访问google服务器
	     3.部署机器为 CentOS7, Ubuntu将后续支持
	            欢迎加入QQ群聊一起讨论Devops技术: 540085853


####   使用帮助:
		1.项目目录需要放在/opt 目录
		2.需提前在ansible主机配置好ssh 无秘钥登入所有集群
		3.修改ikubernetes/ansible/files/hosts文件中的k8s_master 机器
		4.进入ikubernetes/ansible/ansible-playbook/develop/ansible-deploy
			执行 make deploy 即可部署ansible
		5.
            待更新...
###### 注:
            待更新...
**文件介绍:**
            ansible 已经基本完成docker的环境部署
            makefile 基本完成kubernetes 的部署

            待更新...
                ansible完成代替makefile的功能
                更多的平台兼容:ubuntu centos ..
                入口文件改为makefile完成ansible主机的初始化 后续功能全部由ansible实现

**目录介绍:**
###### 注:
            1.ikubernetes/ansible/ansible-playbook/develop/ansible-deploy  完成ansible部署
            2.ikubernetes/ansible/ansible-playbook/develop/init  完成所有机器的环境部署
            3.ikubernetes/ansible/ansible-playbook/develop/docker  完成所有机器docker部署
            4.ikubernetes/ansible/ansible-playbook/develop/clean  完成所有机器获取本项目到目标机器
            5.ikubernetes/ansible/ansible-playbook/develop/ntpsynv  完成所有机器的时间同步
            6.ikubernetes/ansible/ansible-playbook/develop/kubernetes  完成master和node节点的部署