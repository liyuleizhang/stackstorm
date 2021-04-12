# stackstorm docker-compose部署及镜像制作

## stackstorm目录
本目录为stackstorm3.1版本的docker-compose部署方式的配置文件，安装前应禁用防火墙、安装docker和docker-compose，然后设置conf文件夹及文件权限为可执行,启动所有容器即可，注意：docker-compose.yml文件内所有容器镜像为本人私有仓库地址，若无法下载请自行网络搜索测试。

添加私有仓库地址非443连接
```shell
sed -i '/^ExecStart/s/$/ --insecure-registry liyulei.f3322.net:8082/' /usr/lib/systemd/system/docker.service
systemctl daemon-reload
systemctl restart docker
```

启动服务
```shell
chmod -R +x conf/
docker-compose up -d
```	

启动服务
```shell
web登录stackstorm:3.1版本容器端口号80，自定义镜像8081
用户名：admin
密码：admin
本地ip地址
```	

停止容器执行如下命令
```shell
docker-compose down
```

删除持续存储文件执行如下命令
```shell
docker volume ls
docker volume rm stackstorm_mongo-configdb-volume stackstorm_mongo-volume stackstorm_postgres-volume stackstorm_rabbitmq-volume stackstorm_redis-volume stackstorm_stackstorm-configs-volume stackstorm_stackstorm-log-volume stackstorm_stackstorm-packs-volume stackstorm_stackstorm-virtualenvs-volume
```

若使用build-stackstorm-image目录内文件构建了新镜像，修改docker-compose.yml文件的image为新镜像名称启动服务即可
```shell
version: '3'
services:
  astrolabe:
    image: liyulei.f3322.net:8082/stackstorm/stackstorm:3.1
```

## build-stackstorm-image目录
本目录为构建私有stackstorm镜像的dockerfile及配置文件，默认安装ansible，可在build-stackstorm-image/file/packs目录下添加自定义或者网络上的stackstorm的pack包，构建镜像时将自动安装packs文件夹内的包。