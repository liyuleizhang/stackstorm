# stackstorm3.1自定义镜像制作

## conf目录说明

本目录为stackstorm3.1内服务的配置文件，可不做修改

## file目录说明

```shell
.
├── ansible-file	#ansible的playbook及配置文件目录，懂ansible的都能看懂
│   ├── common_vars
│   ├── playbooks
│   ├── roles
│   └── stage
├── packs			#stackstorm的packs包目录，ansible目录不要删，构建自定义镜像默认安装ansible，需要此文件
│   ├── ansible
│   └── st2test
└── python-tests-file	#python测试脚本目录
    └── __pycache__
```

## Dockerfile文件说明
Dockerfile中镜像仓库和pip源为本人私有仓库，若无法下载说明未开机，更换其他地址未测试，pip应该需要翻墙

```shell
# ---- Dependencies ----
FROM liyulei.f3322.net:8082/stackstorm/stackstorm:3.1 AS dependencies

RUN apt-get install -y gcc libkrb5-dev

#COPY contribs/stackstorm-ansible/requirements.txt /stackstorm-ansible-requirements.txt
COPY file/packs/ansible/requirements.txt /stackstorm-ansible-requirements.txt

# 创建Ansible Pack虚拟环境
RUN bash -c 'source /opt/stackstorm/st2/bin/activate \
    && virtualenv -p /usr/bin/python /opt/stackstorm/virtualenvs/ansible'
RUN bash -c 'source /opt/stackstorm/virtualenvs/ansible/bin/activate \
    && pip install setuptools==44.0.0 -i http://liyulei.f3322.net:8081/repository/pypi/simple --trusted-host liyulei.f3322.net \
    && pip install zipp==0.5.0 -i http://liyulei.f3322.net:8081/repository/pypi/simple --trusted-host liyulei.f3322.net'
RUN bash -c 'source /opt/stackstorm/virtualenvs/ansible/bin/activate \
    && pip install -r /stackstorm-ansible-requirements.txt -i http://liyulei.f3322.net:8081/repository/pypi/simple --trusted-host liyulei.f3322.net'

# 创建Astrolabe虚拟环境
COPY file/astrolabe-requirements.txt /astrolabe-requirements.txt
RUN cp -R /opt/stackstorm/virtualenvs/ansible /opt/stackstorm/virtualenvs/astrolabe_core
RUN bash -c 'source /opt/stackstorm/virtualenvs/astrolabe_core/bin/activate \
    && pip install -r /astrolabe-requirements.txt -i http://liyulei.f3322.net:8081/repository/pypi/simple --trusted-host liyulei.f3322.net'

# ---- Release ----
FROM liyulei.f3322.net:8082/stackstorm/stackstorm:3.1 AS release

# 安装Ansible依赖操作系统包
RUN apt-get install -y gcc libkrb5-dev


COPY conf/packs.dev /opt/stackstorm/packs.dev
COPY conf/runtime/entrypoint.d /st2-docker/entrypoint.d
COPY conf/runtime/st2.d /st2-docker/st2.d
COPY file/ansible-file /etc/ansible
#COPY contribs/stackstorm-ansible /opt/stackstorm/packs/ansible
COPY file/packs/ /opt/stackstorm/packs/

COPY --from=dependencies /opt/stackstorm/virtualenvs/ /opt/stackstorm/virtualenvs/

COPY conf/nginx/st2-base.cnf /etc/nginx/conf.d/
RUN rm -f /etc/nginx/conf.d/default.conf
RUN rm -f /etc/nginx/conf.d/st2-1ppc.conf.tpl

RUN mkdir /src
COPY file/python-tests-file /src/tests

EXPOSE 8001
```

## 构建镜像

修改好file文件夹内的三个服务文件后执行如下命令构建镜像,若构建失败，请检查镜像仓库地址、pip源地址
```shell
docker build -t stackstorm:v1 ./
```