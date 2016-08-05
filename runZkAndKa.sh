#!/bin/bash
name=$(docker inspect -f '{{ .Name }}' zookeeper)
if [ "$name" == "/zookeeper"  -a "$1" != "-f" ]
then
    docker start zookeeper
else
    docker run -d  -p 2181:2181 --restart=always --name zookeeper 192.168.1.201:5000/zookeeper:3.4.8
fi

name=$(docker inspect -f '{{ .Name }}' kafka)
if [ "$name" == "/kafka"  -a "$1" != "-f" ]
then
    docker start kafka
else
    docker run -d -v /data/kafka:/data -v /data/logs:/logs -p 9092:9092 \
        --hostname 192.168.1.201 \
        --name kafka \
        -e KAFKA_ADVERTISED_HOST=192.168.1.201 \
        -e ZOOKEEPER_IP=192.168.1.201 \
        --restart=always 192.168.1.201:5000/kafka:0.10.0.0
fi

