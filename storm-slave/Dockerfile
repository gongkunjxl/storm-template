FROM gongkunjxl/serf-dnsmasq:0.1.0

MAINTAINER gongkun <gongkunjxl@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update && apt-get install -y openjdk-8-jdk python

#files
COPY files/* /tmp/
#RUN mv /tmp/bashrc ~/.bashrc && \
RUN mv /tmp/bashrc ~/.bashrc && \
    mv /tmp/start-ssh-serf.sh ~/start-ssh-serf.sh

RUN chmod -R 777 ~/start-ssh-serf.sh

RUN mkdir /home/zkdata && \
    mkdir /home/stdata && \
    mkdir /root/storm-1.0.5 && \
    mkdir /root/zookeeper-3.4.10
   
ADD storm-1.0.5 /root/storm-1.0.5/
ADD zookeeper-3.4.10 /root/zookeeper-3.4.10

RUN chmod 644 ~/.ssh/config

EXPOSE 22 7373 7946 9000 50010 50020 50070 50075 50090 50475 8030 8031 8032 8033 8040 8042 8060 8088 50060 6700 6701 6702 6703 2128 2888 3888

CMD '/root/start-ssh-serf.sh'; 'bash'
















