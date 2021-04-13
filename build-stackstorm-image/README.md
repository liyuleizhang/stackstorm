# stackstorm3.1自定义镜像制作

## file目录说明

```shell
.
├── ansible-file	#ansible的playbook及配置文件目录，懂ansible的都能看懂
│   ├── playbooks
│   │   └── test
│   ├── roles
│   │   └── test
│   │       └── test
│   │           └── tasks
│   └── stage
│       └── test
├── packs			#stackstorm的packs包目录
│   ├── ansible_core
│   │   └── actions
│   │       ├── scripts
│   │       └── workflows
│   └── test
│       └── actions
│           ├── shell
│           └── workflows
└── python-tests-file	#python测试脚本目录
    └── __pycache__
```

## Dockerfile文件说明
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

## 构建镜像

修改好file文件夹内的三个服务文件后执行如下命令构建镜像
```shell
docker build -t stackstorm:v1 ./
```