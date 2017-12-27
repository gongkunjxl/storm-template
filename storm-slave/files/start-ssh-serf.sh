#!/bin/bash

# start sshd
echo -e "start sshd..."
service ssh start

echo -e "source...."
source ~/.bashrc

# start sef
echo -e "\nstart serf..." 
/etc/serf/start-serf-agent.sh > serf_log &

sleep 5

serf members

echo -e "\nstorm-cluster-docker developed by gongkun <gongkunjxl@163.com>"
