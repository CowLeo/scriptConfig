#!/bin/bash
name=$(docker inspect -f '{{ .Name }}' registry)
echo $1
echo $name
if [ "$name" == "/registry"  -a "$1" != "-f" ]
then
    docker start registry
else
    echo "ok body"
    docker run -d -v /opt/data/registry:/tmp/registry -p 5000:5000 --restart=always --name registry registry:2.4
fi
#docker run -d -v /opt/data/registry:/tmp/registry -p 5000:5000 --restart=always --name registry registry:2.4

