# stackstorm3.1自定义镜像制作

## file目录说明

```shell
.
└── file
    ├── ansible-file    #固定目录，ansible的playbook及配置文件目录，懂ansible的都能看懂
    │   ├── playbooks    #固定目录，playbooks目录，执行ansible指定此目录下的步骤进行
    │   │   └── test    #自定义名称目录，test测试playbooks目录
    │   ├── roles    #固定目录，脚本目录，在playbooks定义调用此目录下脚本
    │   │   └── test    #自定义名称目录，test脚本目录
    │   │       ├── install_docker_ce    #自定义名称目录，安装docer脚本的目录
    │   │       │   └── tasks    #固定目录，脚本目录，名称固定
    │   │       └── test    #自定义名称目录，测试的脚本目录
    │   │           └── tasks    #固定目录，脚本目录，名称固定
    │   └── stage    #固定目录，hosts目录
    │       └── test    #自定义名称目录，test的hosts目录
    ├── packs			#固定目录，stackstorm的packs模块目录
    │   ├── ansible_core    #自定义名称目录，名称为ansible_core的pack模块目录
    │   │   └── actions    #固定目录，脚本目录
    │   │       ├── scripts    #自定义名称目录，调用的脚本类型分类目录
    │   │       └── workflows    #自定义名称目录，调用的脚本类型分类目录
    │   └── test    #自定义名称目录，名称为test的pack模块目录
    │       └── actions    #固定目录，脚本目录
    │           ├── shell     #自定义名称目录，调用的脚本类型分类目录
    │           └── workflows    #自定义名称目录，调用的脚本类型分类目录
    └── python-tests-file	#python脚本目录
        └── __pycache__

```

## 文件说明
### build-stackstorm-image/Dockerfile文件说明
```shell
.
├── Dockerfile    #此文件说明
├── file
└── README.md
```
此文件在build-stackstorm-image根目录下，作用是修改了file中的文件后，根据liyulei.f3322.net:8082/astrolabe/astrolabe:1.0.7容器镜像构建新的镜像，镜像内包含修改好的ansible、stackstorm_pack、python脚本。
```shell
#因用stackstorm3.1版本比较老，用stackstorm3.1进行版本进行构建，安装的包会被更新到最新版本，导致部分服务不正常，所以，使用已构建过版本的镜像进行更新
FROM liyulei.f3322.net:8082/astrolabe/astrolabe:1.0.7

RUN rm -rf /etc/ansible
RUN rm -rf /opt/stackstorm/packs/astrolabe /opt/stackstorm/packs/astrolabe_core /opt/stackstorm/packs/astrolabe_examples
RUN rm -rf /src/tests

COPY file/ansible-file /etc/ansible
COPY file/packs/ /opt/stackstorm/packs/
COPY file/python-tests-file /src/tests
```
修改好file文件夹内的三个服务文件后执行如下命令构建镜像
```shell
docker build -t stackstorm:v1 ./
```

### build-stackstorm-image/file/packs/test/icon.png文件说明
```shell
.
├── Dockerfile
├── file
│   ├── ansible-file
│   ├── packs
│   │   ├── ansible_core
│   │   └── test
│   │       ├── actions
│   │       ├── icon.png    #此文件说明
│   │       └── pack.yaml
│   └── python-tests-file
└── README.md
```
此文件为图片文件，最终显示在stackstorm的web页面下图1样式

（图1）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210422-161215.png)

### build-stackstorm-image/file/packs/test/pack.yaml文件说明
```shell
.
├── Dockerfile
├── file
│   ├── ansible-file
│   ├── packs
│   │   ├── ansible_core
│   │   └── test
│   │       ├── actions
│   │       ├── icon.png
│   │       └── pack.yaml    #此文件说明
│   └── python-tests-file
└── README.md
```
此文件为模块说明文件
```shell
---
ref: test    #模块名称，只能英文，web页面显示，见图2，和模块文件夹保持一致build-stackstorm-image/file/packs/test
name: test    #模块名称，只能英文，可以当做说明使用，web页面不显示，安装的时候显示
description: 测试各种功能    #模块说明
keywords:    #搜索时的标签
    - example
    - test
version: 0.0.1    #模块版本，自定义
python_versions:    #stackstorm平台的python版本（下面所写python2和3均可用）
  - "2"
  - "3"
author: 张三    #此模块作者
email: zhangsan@163.com    #此模块作者邮箱
```
（图2）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210422-161424.png)


### packs脚本文件说明例1
build-stackstorm-image/file/packs/test/actions/1.touch_ansible_inventory.yaml
build-stackstorm-image/file/packs/test/actions/workflows/1.touch_ansible_inventory.yaml 
```shell
.
├── Dockerfile
├── file
│   ├── ansible-file
│   ├── packs
│   │   ├── ansible_core
│   │   └── test
│   │       ├── actions
│   │       │   ├── 1.touch_ansible_inventory.yaml    #此文件说明   
│   │       │   ├── shell
│   │       │   └── workflows
│   │       │       └── 1.touch_ansible_inventory.yaml    #此文件说明
│   │       ├── icon.png
│   │       └── pack.yaml
│   └── python-tests-file
└── README.md
```
build-stackstorm-image/file/packs/test/actions/1.touch_ansible_inventory.yaml文件为模块文件，对比见图3
```shell
---
name: 1.touch_ansible_inventory    #模块名称，与文件名相同
description: 创建ansible的...ssword。    #模块说明
runner_type: orquesta    #模块类型，orquesta为调用yaml或json文件
entry_point: workflows/1.touch_ansible_inventory.yaml    #调用的文件位置
enabled: true
parameters:    #输入框
  node01_1_ansible_hosts:    #输入框名称
    type: string    #输入框内填写的文件类型
    required: true    #输入框是否比填
    description: node1节点ip地址（例如：192.168.1.2）    #输入框说明文字
    default: ''    #如果不输入的默认值，此处为空值，必须人工填写
    position: 1    #输入框内填写后的默认变量是$1,供entry_point: workflows/1.touch_ansible_inventory.yaml调用
  node01_2_ansible_port:
    type: integer
    required: true
    description: node1节点ssh端口,不填默认22端口（例如：22）
    default: 22
    position: 2
  node01_3_ansible_user:
    type: string
    required: true
    description: node1节点用户名，不填默认root用户（例如：root）
    default: root
    position: 3
  node01_4_ansible_password:
    required: true
    description: node1节点密码（例如：123456）
    default: ''
    position: 4
```

（图3）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210422-164050.png)

build-stackstorm-image/file/packs/test/actions/workflows/1.touch_ansible_inventory.yaml脚本文件
```shell
version: 1.0   #版本
description: 创建inventory文件，并输入一条记录   #本脚本说明
input:    #调用build-stackstorm-image/file/packs/test/actions/1.touch_ansible_inventory.yaml下的变量
- node01_1_ansible_hosts
- node01_2_ansible_port
- node01_3_ansible_user
- node01_4_ansible_password
tasks:    #脚本
  touch_ansible_inventory:    #名称
    action: core.local_sudo    #调用core下的local_sudo模块
    input:    #调用上面input导入的变量
      cmd: 'echo "node01 ansible_host="{{ ctx("node01_1_ansible_hosts") }}" ansible_port="{{ ctx("node01_2_ansible_port") }}" ansible_user="{{ ctx("node01_3_ansible_user") }}" ansible_password="{{ ctx("node01_4_ansible_password") }}"" >/etc/ansible/stage/test/inventory && cat /etc/ansible/stage/test/inventory'    #在local_sudo模块下的cmd输入框输入''内的内容，"{{ ctx("##") }}"为调用的变量
```

actions/1.touch_ansible_inventory.yaml和actions/workflows/1.touch_ansible_inventory.yaml文件关系图如图4

（图4）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210423-092025.png)

实际例1编写的两个脚本的功能可以在core模块下的local_sudo中的cmd中输入如下内容，执行后和例1结果相同，如图5
```shell
echo "node01 ansible_host=ip地址 ansible_port=端口号 ansible_user=用户名 ansible_password=密码" >/etc/ansible/stage/test/inventory && cat /etc/ansible/stage/test/inventory
```
（图5）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210423-093105.png)

例1与2.add_ansible_hosts.yaml和2.add_ansible_hosts.yaml写法与调用相同，参照例1理解

### packs脚本文件说明例2
build-stackstorm-image/file/packs/test/actions/3.create_ansible_inventory.yaml
build-stackstorm-image/file/packs/test/actions/shell/3.create_ansible_inventory.sh
```shell
.
├── Dockerfile
├── file
│   ├── ansible-file
│   ├── packs
│   │   ├── ansible_core
│   │   └── test
│   │       ├── actions
│   │       │   ├── 3.create_ansible_inventory.yaml    #此文件说明   
│   │       │   ├── shell
│   │       │       └── 3.create_ansible_inventory.sh    #此文件说明
│   │       │   └── workflows
│   │       ├── icon.png
│   │       └── pack.yaml
│   └── python-tests-file
└── README.md
```
build-stackstorm-image/file/packs/test/actions/3.create_ansible_inventory.yaml文件为模块文件，对比见图6
```shell
---
name: 3.create_ansible_inventory    #模块名称，与文件名相同
runner_type: "local-shell-script"    #模块类型，此类型支持在指定主机中执行shell脚本
description: "创建ansible的in。。。word。"    #模块说明
enabled: true
entry_point: 'shell/3.create_ansible_inventory.sh'    #调用shell脚本位置
parameters:    #输入框
  sudo:    #设置以管理员身份运行
    default: true
    immutable: true
  node01:    #输入框名称
    type: string    #输入内容类型
    required: true   #输入框是否比填
    description: '填写格。。。56）'    #输入框说明文字
    default: 'node01 ansible_host=192.168.1.1 ansible_port=22 ansible_user=root ansible_password=123456'   #如果不输入的默认值
    position: 1   #输入框内填写后的默认变量是$1,供entry_point: 'shell/3.create_ansible_inventory.sh'调用
  node02:
    type: string
    required: true
    description: '填写格式:节点名称 ansible_host=ip地址 ansible_port=ssh端口 ansible_user=用户名 ansible_password=密码,不填则为空。（例如：node02 ansible_host=192.168.1.2 ansible_port=22 ansible_user=root ansible_password=123456）'
    default: '#'
    position: 2
  node03:
    type: string
    required: true
    description: '填写格式:节点名称 ansible_host=ip地址 ansible_port=ssh端口 ansible_user=用户名 ansible_password=密码,不填则为空。（例如：node03 ansible_host=192.168.1.3 ansible_port=22 ansible_user=root ansible_password=123456）'
    default: '#'
    position: 3
  node04:
    type: string
    required: true
    description: '填写格式:节点名称 ansible_host=ip地址 ansible_port=ssh端口 ansible_user=用户名 ansible_password=密码,不填则为空。（例如：node04 ansible_host=192.168.1.4 ansible_port=22 ansible_user=root ansible_password=123456）'
    default: '#'
    position: 4

```

（图6）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210423-101848.png)

build-stackstorm-image/file/packs/test/actions/shell/3.create_ansible_inventory.sh脚本文件
这个就是普通的shell脚本
```shell
#!/usr/bin/env bash

node01=$1
node02=$2
node03=$3
node04=$4

cat > /etc/ansible/stage/test/inventory <<- EOF
${node01}
${node02}
${node03}
${node04}
EOF

cat /etc/ansible/stage/test/inventory
```

actions/3.create_ansible_inventory.yaml和actions/shell/3.create_ansible_inventory.sh对应图如图7

（图7）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210423-103258.png)

### packs脚本文件说明例3
build-stackstorm-image/file/packs/test/actions/4.testing_ansible_inventory.yaml
build-stackstorm-image/file/packs/test/actions/workflows/4.testing_ansible_inventory.yaml 
```shell
.
├── Dockerfile
├── file
│   ├── ansible-file
│   ├── packs
│   │   ├── ansible_core
│   │   └── test
│   │       ├── actions
│   │       │   ├── 4.testing_ansible_inventory.yaml    #此文件说明   
│   │       │   ├── shell
│   │       │   └── workflows
│   │       │       └── 4.testing_ansible_inventory.yaml    #此文件说明
│   │       ├── icon.png
│   │       └── pack.yaml
│   └── python-tests-file
└── README.md
```
build-stackstorm-image/file/packs/test/actions/4.testing_ansible_inventory.yaml文件为模块文件，对比见图8
```shell
---
name: 4.testing_ansible_inventory    #模块名称，与文件名相同
description: 查看创建的ansible_inventory文件内容，并测试是否能正常连通，ansible的ping命令    #模块说明
runner_type: orquesta    #模块类型，orquesta为调用yaml或json文件
entry_point: workflows/4.testing_ansible_inventory.yaml    #调用的文件位置
enabled: true
parameters:    #输入框
  filepath:    #输入框名称
    description: "inventory文件的绝对路径"    #输入框说明文字
    default: "/etc/ansible/stage/test/inventory"    #默认带入值
    type: string   #输入框内填写的文件类型
    required: true   #输入框是否比填
    position: 0    #输入框内填写后的默认变量是$0
```

（图8）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210423-105500.png)

build-stackstorm-image/file/packs/test/actions/workflows/4.testing_ansible_inventory.yaml脚本文件
```shell
version: 1.0   #版本
description: 查看指定inventory文件，并测试是否能正常连通，ansible的ping命令   #本脚本说明
input:    #调用build-stackstorm-image/file/packs/test/actions/4.testing_ansible_inventory.yaml下的变量
- filepath
tasks:    #脚本
  cat_ansible_inventory:    #第一个脚本名称
    action: core.local_sudo cmd='cat {{ ctx("filepath") }}'    #调用core下的local_sudo模块下的cmd输入框输入''内的内容，"{{ ctx("##") }}"为调用的变量
    next:    #判断
    - when: "{{ succeeded() }}"    #如果执行完本脚本返回为succeeded完成
      do:    #则执行下面的内容
      - ping_ansible_inventory    #执行名称为ping_ansible_inventory的脚本
    - when: "{{ failed() }}"    #如果执行完本脚本返回为failed未完成
      do:    #则执行下面的内容
      - fail    #停止运行
  ping_ansible_inventory:    #第二个脚本名称
    action: ansible.command inventory_file='{{ ctx("filepath") }}' hosts='all' module_name='ping'   #调用ansible下的command模块下的inventory_file输入框输入''内的内容，"{{ ctx("##") }}"为调用的变量，hosts输入框内的内容指定为all，module_name输入框内的内容指定为ping
```

actions/4.testing_ansible_inventory.yaml和actions/workflows/4.testing_ansible_inventory.yaml文件关系图如图9

（图9）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210423-092025.png)

实际例1编写的两个脚本的功能可以在core模块下的local_sudo中的cmd中输入如下内容，执行后和例1结果相同，如图10
```shell
echo "node01 ansible_host=ip地址 ansible_port=端口号 ansible_user=用户名 ansible_password=密码" >/etc/ansible/stage/test/inventory && cat /etc/ansible/stage/test/inventory
```
（图10）
![Image text](https://raw.githubusercontent.com/liyuleizhang/img/main/stackstorm/WX20210423-093105.png)

