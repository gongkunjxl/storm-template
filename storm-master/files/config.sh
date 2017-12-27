#!/bin/bash
echo master.gongkun.com > /root/slaves;
for i in  $(seq $(serf members|grep slave|grep alive |wc -l)) ; do echo slave$i.gongkun.com >> /root/slaves; done;
cat /etc/hosts|grep -v storm|grep -v master > /tmp/hosts
cat /tmp/hosts > /etc/hosts
serf members |grep alive |awk -F :7946 '{print $1}'|awk '{print $2 "\t" $1}'>> /etc/hosts;
serf members |grep master|awk -F :  '{print $1}'|awk '{print $2"\tmaster.gongkun.com"}' >> /etc/hosts;
cc=0;cat /etc/hosts|grep storm-slave|while read line ; do ((cc++)); echo $line slave$cc.gongkun.com >> /etc/hosts; done;
echo "1" > /home/zkdata/myid
i=2
cat /root/slaves|grep slave|while read line ; do scp -o StrictHostKeyChecking=no /etc/hosts $line:/etc/hosts; echo $i > myid; scp -o StrictHostKeyChecking=no /root/myid $line:/home/zkdata/myid; i=$(( $i + 1 )); done; 
