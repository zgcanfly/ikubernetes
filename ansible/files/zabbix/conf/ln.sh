#!/bin/bash
mkdir /etc/zabbix
killall zabbix_agentd
ln -sf /usr/local/zabbix/bin/zabbix_sender /usr/bin/zabbix_sender
ln -sf /usr/local/zabbix/conf/zabbix_agentd.conf /usr/local/etc/
"/usr/local/zabbix-agentd/sbin/zabbix_agentd  start" >>/etc/rc.local
npm install -g pm2-zabbix
/usr/local/zabbix/sbin/zabbix_agentd start
#pm2-zabbix --server=10.252.95.29 --monitor --debug --hostname=ht1
