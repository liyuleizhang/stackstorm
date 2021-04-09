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
