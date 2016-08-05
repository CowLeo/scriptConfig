#!/bin/bash
name=$(docker inspect -f '{{ .Name }}' rsyslog)
if [ "$name" == "/rsyslog"  -a "$1" != "-f" ]
then
    docker start rsyslog
else
    docker run -d -v /var/log:/var/log -v /etc/rsyslog.d:/etc/rsyslog.d -p 514:514 --restart=always --name rsyslog 192.168.1.201:5000/rsyslog:latest
fi

