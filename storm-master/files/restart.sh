#/bin/bash
echo -e "start ZooKeeper"
$ZOOKEEPER_HOME/bin/zkServer.sh start
i=0
ip_arr=($(cat slaves | grep slave));
ip_len=${#ip_arr[*]};
while [ $i -lt $ip_len ]
do
  ssh ${ip_arr[$i]} "$ZOOKEEPER_HOME/bin/zkServer.sh start; exit";
  i=$(( $i + 1 ));
done

echo -e "start storm"
storm nimbus & 
i=0
while [ $i -lt $ip_len ]
do
  ssh ${ip_arr[$i]} "echo -e 'storm supervisor & ' > start.sh; echo -e 'exit' >> start.sh; chmod 777 start.sh; ./start.sh; exit";
  i=$(( $i + 1 ));
done

echo -e "restart master storm ui logger"
storm ui & 
storm logviewer &
