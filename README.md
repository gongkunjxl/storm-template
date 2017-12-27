# storm-template
1.storm 版本1.0.5 zookeeper版本3.4.10 
下载地址: http://www.apache.org/dyn/closer.lua/storm/apache-storm-1.0.5/apache-storm-1.0.5.zip
 https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.10/
 由于配置文件写死 目前只支持两个slave的pod节点 可自行扩展
 2.从docker hub 上pull gongkunjxl/storm-master gongkunjxl/storm-slave镜像，创建工程 创建template下的json template
 即可运行
 3.启动master下面的restart.sh文件 重要: 由于storm启动在后台 不退出节点 可以多次按ctrl+c 通过master的ip和8080端口查看启动情况。
