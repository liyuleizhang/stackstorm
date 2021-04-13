# ！需要在部署机设置所有节点host
# ！所有节点hostanme不应该包含“.”，见： https://tools.ietf.org/html/rfc952

registry ansible_host=172.16.1.200   ansible_port=22     ansible_user=root   ansible_password=neokylin

# onex节点列表
onex01   ansible_host=172.16.1.201   ansible_port=22     ansible_user=root   ansible_password=neokylin

# whitehole节点列表
wh01    ansible_host=172.16.1.202   ansible_port=22     ansible_user=root   ansible_password=neokylin

# hubble节点列表
datamanager01    ansible_host=172.16.1.203   ansible_port=22     ansible_user=root   ansible_password=neokylin
datamanager02    ansible_host=172.16.1.204   ansible_port=22     ansible_user=root   ansible_password=neokylin
datagovern01     ansible_host=172.16.1.205   ansible_port=22     ansible_user=root   ansible_password=neokylin

# common组件节点列表
data01   ansible_host=172.16.1.207   ansible_port=22     ansible_user=root   ansible_password=neokylin
data02   ansible_host=172.16.1.208   ansible_port=22     ansible_user=root   ansible_password=neokylin
data03   ansible_host=172.16.1.209   ansible_port=22     ansible_user=root   ansible_password=neokylin

# wso2节点列表
am01   ansible_host=172.16.1.210   ansible_port=22     ansible_user=root   ansible_password=neokylin

########################################################################################################
# Common Groups
########################################################################################################

[registry_server]
registry chrony_role=server

[servers:children]
registry_server
fast_servers
cdh_servers
gp_servers
mysql_servers
rabbitmq_servers
zookeeper_servers
kafka_servers

########################################################################################################
# Monitoring Groups
########################################################################################################

[monitoring-master]
registry

[monitoring-minion:children]
servers

########################################################################################################
# FAST Groups
########################################################################################################

[onex-basic]
onex01 server_id=1 vrrp_interface_name=ens192 vrrp_state=MASTER vrrp_priority=100

[onex-extension]
onex01

[onex_servers:children]
onex-basic
onex-extension

[fast-basic] # 未确认角色用途？
wh01

[wh_servers]
wh01

[hb_metagrid]
datamanager01
datamanager02

[hb_standalone]
datagovern01

[hb_kettle]
datamanager01
datamanager02

[hb_nifi]
datagovern01

[hb_stargate]
datamanager01
datamanager02

[hb_broker]
datamanager01
datamanager02

[hubble_servers:children]
hb_metagrid
hb_stargate
hb_kettle
hb_nifi
hb_broker

[fast_servers:children]
fast-basic
onex_servers
wh_servers
hubble_servers

########################################################################################################
# CDH Groups
########################################################################################################

[scm_server]

[db_server]

[krb5_server]

[utility_servers:children]
scm_server
db_server
krb5_server

[gateway_servers]

[edge_servers]

[master_servers]

[worker_servers]

[worker_servers:vars]
host_template=HostTemplate-Workers

[cdh_servers:children]
utility_servers
gateway_servers
master_servers
worker_servers

########################################################################################################
# Greenplum Groups
########################################################################################################

[gpmaster_servers]

[gpsegment_servers]

[gp_servers:children]
gpmaster_servers
gpsegment_servers

########################################################################################################
# Mysql Groups
########################################################################################################

[mysql]

[mgr_primary]
data01 server_id=1 vrrp_state=MASTER vrrp_priority=100

[mgr_slave]
data02 server_id=2 vrrp_state=BACKUP vrrp_priority=90
data03 server_id=3 vrrp_state=BACKUP vrrp_priority=90

[mgr_servers:children]
mgr_primary
mgr_slave

[mysql_servers:children]
mysql
mgr_servers

########################################################################################################
# RabbitMQ Groups
########################################################################################################

[rabbitmq] # 单节点部署组

[rabbitmq_first] # RabbitMQ集群第一个节点，用于初始集群的操作
data01  node_id=1 node_type=disc

[rabbitmq_node] # RabbitMQ其他节点，可以部署多个； node_type代表节点在集群中是 磁盘节点（disc）还是内存节点（ram）
data02  node_id=2 node_type=disc
data03  node_id=3 node_type=ram

[rabbitmq_servers:children]
rabbitmq
rabbitmq_first
rabbitmq_node

########################################################################################################
# Zookeeper Groups
########################################################################################################

[zookeeper] # 单节点部署组

[zookeeper_ha] # 集群部署组
data01  myid=1
data02  myid=2
data03  myid=3

[zookeeper_servers:children]
zookeeper
zookeeper_ha

########################################################################################################
# Kafka Groups
########################################################################################################

[kafka] # 单节点部署组

[kafka_ha] # 集群部署组

[kafka_servers:children]
kafka
kafka_ha

