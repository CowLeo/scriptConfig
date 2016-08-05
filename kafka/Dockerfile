FROM java:8-jre-alpine
MAINTAINER coolcow <18686224@qq.com>

ARG MIRROR=http://apache.mirrors.pair.com
ARG VERSION=0.10.0.0
ARG SCALA_VERSION=2.11
ARG JMX_PORT=7203

LABEL name="kafka" version=$VERSION
RUN mkdir /data /logs
RUN apk add --no-cache wget bash \
    && mkdir /opt \
    && wget -q -O - $MIRROR/kafka/$VERSION/kafka_$SCALA_VERSION-$VERSION.tgz | tar -xzf - -C /opt \
    && mv /opt/kafka_$SCALA_VERSION-$VERSION /opt/kafka \
    && mkdir -p /tmp/kafka

ADD config /opt/kafka/config
ADD start.sh /opt/kafka/start.sh

EXPOSE 9092 ${JMX_PORT}

WORKDIR /opt/kafka

VOLUME ["/data", "/logs"]

# ENTRYPOINT ["/opt/kafka/bin/kafka-server-start.sh"]
ENTRYPOINT ["/opt/kafka/start.sh"]
CMD ["start-foreground"]
