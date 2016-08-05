FROM alpine:3.4
MAINTAINER coolcow <18686224@qq.com>
RUN  apk add --update rsyslog \
  && rm -rf /var/cache/apk/*

EXPOSE 514 514/udp

VOLUME [ "/var/log", "/etc/rsyslog.d" ]

# for some reason, the apk comes built with a v5
# config file. using this one for v8:
COPY rsyslog.conf /etc/rsyslog.conf

ENTRYPOINT [ "rsyslogd", "-n" ]
