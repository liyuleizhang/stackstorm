# ！需要在部署机设置所有节点host
# ！所有节点hostanme不应该包含“.”，见： https://tools.ietf.org/html/rfc952
# ！Devops开发环境 172.16.1.136 ～ 139保留为虚拟IP使用

registry ansible_host=172.16.1.146   ansible_port=22     ansible_user=root   ansible_password=centos

# onex节点列表
onex01   ansible_host=172.16.1.140   ansible_port=22     ansible_user=root   ansible_password=hadoop
onex02   ansible_host=172.16.1.141   ansible_port=22     ansible_user=root   ansible_password=hadoop

# whitehole节点列表
wh01    ansible_host=172.16.1.142   ansible_port=22     ansible_user=root   ansible_password=hadoop
wh02    ansible_host=172.16.1.143   ansible_port=22     ansible_user=root   ansible_password=hadoop

# hubble节点列表
datamanager01    ansible_host=172.16.1.100   ansible_port=22     ansible_user=root   ansible_password=centos
datamanager02    ansible_host=172.16.1.101   ansible_port=22     ansible_user=root   ansible_password=centos
datagovern01     ansible_host=172.16.1.102   ansible_port=22     ansible_user=root   ansible_password=centos

# common组件节点列表
data01   ansible_host=172.16.1.147   ansible_port=22     ansible_user=root   ansible_password=centos
data02   ansible_host=172.16.1.148   ansible_port=22     ansible_user=root   ansible_password=centos
data03   ansible_host=172.16.1.149   ansible_port=22     ansible_user=root   ansible_password=centos

# cdh节点列表
cdh01   ansible_host=172.16.1.30   ansible_port=22     ansible_user=root   ansible_password=hadoop
cdh02   ansible_host=172.16.1.31   ansible_port=22     ansible_user=root   ansible_password=hadoop
cdh03   ansible_host=172.16.1.32   ansible_port=22     ansible_user=root   ansible_password=hadoop
cdh04   ansible_host=172.16.1.33   ansible_port=22     ansible_user=root   ansible_password=hadoop
cdh05   ansible_host=172.16.1.34   ansible_port=22     ansible_user=root   ansible_password=hadoop

# greenplum节点列表
# The Greenplum Database host naming convention for the master host is mdw and for the standby master host is smdw.
# The segment host naming convention is sdwN where sdw is a prefix and N is an integer.
# For example, segment host names would be sdw1, sdw2 and so on.
# NIC bonding is recommended for hosts with multiple interfaces, but when the interfaces are not bonded,
# the convention is to append a dash (-) and number to the host name. For example, sdw1-1 and sdw1-2 are the two interface names for host sdw1.
mdw      ansible_host=172.16.1.40   ansible_port=22     ansible_user=root   ansible_password=greenplum
#smdw    ansible_host=172.16.1.40   ansible_port=22     ansible_user=root   ansible_password=greenplum
sdw01    ansible_host=172.16.1.41   ansible_port=22     ansible_user=root   ansible_password=greenplum
sdw02    ansible_host=172.16.1.42   ansible_port=22     ansible_user=root   ansible_password=greenplum
sdw03    ansible_host=172.16.1.43   ansible_port=22     ansible_user=root   ansible_password=greenplum
sdw04    ansible_host=172.16.1.44   ansible_port=22     ansible_user=root   ansible_password=greenplum

# 未使用节点列表
# idle01   ansible_host=172.16.1.144   ansible_port=22     ansible_user=root   ansible_password=hadoop
# idle02   ansible_host=172.16.2.44   ansible_port=22     ansible_user=root   ansible_password=hadoop
# idle03   ansible_host=172.16.2.45   ansible_port=22     ansible_user=root   ansible_password=hadoop

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
onex02 server_id=2 vrrp_interface_name=ens192 vrrp_state=BACKUP vrrp_priority=90

[onex-extension]
onex01
onex02

[onex_servers:children]
onex-basic
onex-extension

[fast-basic] # 未确认角色用途？
wh01
wh02

[wh_servers]
wh01
wh02

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
cdh01

[db_server]
cdh01

[krb5_server]
cdh01

[utility_servers:children]
scm_server
db_server
krb5_server

[gateway_servers]
cdh01 host_template=HostTemplate-Gateway

[edge_servers]
cdh01 host_template=HostTemplate-Edge role_ref_names=HDFS-HTTPFS-1

[master_servers]
cdh01 host_template=HostTemplate-Master1
# <host> host_template=HostTemplate-Master2
# <host> host_template=HostTemplate-Master3

[worker_servers]
cdh02
cdh03
cdh04
cdh05

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
mdw

[gpsegment_servers]
sdw01
sdw02
sdw03
sdw04

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
data01  myid=1
data02  myid=2
data03  myid=3

[kafka_servers:children]
kafka
kafka_ha

