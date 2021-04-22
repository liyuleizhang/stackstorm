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
│   │       │   └── workflows
│   │       │       └── 1.touch_ansible_inventory.yaml    #此文件说明
│   │       ├── icon.png
│   │       └── pack.yaml
│   └── python-tests-file
└── README.md
```

## 构建镜像

修改好file文件夹内的三个服务文件后执行如下命令构建镜像
```shell
docker build -t stackstorm:v1 ./
```