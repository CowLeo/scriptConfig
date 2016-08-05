# scriptConfig
# 系统要求 CentOS 7 以上，Docker 1.9 以上。

sudo cp -n /lib/systemd/system/docker.service /etc/systemd/system/docker.service
sudo sed -i "s|ExecStart=/usr/bin/docker daemon|ExecStart=/usr/bin/docker daemon --registry-mirror=https://j44rcyid.mirror.aliyuncs.com|g" /etc/systemd/system/docker.service
sudo systemctl daemon-reload
sudo service docker restart

# Installing Machine Directly

$ curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/bin/docker-machine && \
        chmod +x /usr/bin/docker-machine
