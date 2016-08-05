#!bin/bash
docker -H 192.168.1.201:2376 run --name redis149 -d -e constraint:label_name==149 192.168.1.201:5000/redis:3.2.1
