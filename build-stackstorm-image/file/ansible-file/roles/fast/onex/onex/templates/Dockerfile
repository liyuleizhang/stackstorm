FROM hub.chinacloud.com.cn/onex.rel/keycloak:3.4.0.Final.FAST.V2.0.0.RELEASE

ENV JAVA_OPTS "$JAVA_OPTS -Djava.net.preferIPv4Stack=true"

CMD ["-b", "0.0.0.0", "--server-config", "standalone-ha.xml"]
