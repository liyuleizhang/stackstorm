FROM liyulei.f3322.net:8082/astrolabe/astrolabe:1.0.7

RUN rm -rf /etc/ansible
RUN rm -rf /opt/stackstorm/packs/astrolabe /opt/stackstorm/packs/astrolabe_core /opt/stackstorm/packs/astrolabe_examples
RUN rm -rf /src/tests

COPY file/ansible-file /etc/ansible
COPY file/packs/ /opt/stackstorm/packs/
COPY file/python-tests-file /src/tests

#COPY --from=dependencies /opt/stackstorm/virtualenvs/ /opt/stackstorm/virtualenvs/
