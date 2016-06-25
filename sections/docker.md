## repository

```bash
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
. /etc/lsb-release
echo "deb https://apt.dockerproject.org/repo ubuntu-$DISTRIB_CODENAME main" > /etc/apt/sources.list.d/docker.list
apt-get update
```

## install

```bash
apt-get install -y docker-engine
```

### Mint
```bash
# For Linux Mint Rebecca 17.1
# replace one line in ^above bash recipe^
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
```
~~[Install-Docker-on-Linux-Mint](https://gist.github.com/sirkkalap/e87cd580a47b180a7d32)~~

## install docker-compose

```bash
curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## install docker-machine (for docker remote)

[docker-machine](https://docs.docker.com/machine/overview/)

```bash
curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine
docker-machine create --driver generic --generic-ip-address=IP --generic-ssh-user=USER --generic-ssh-key=~/.ssh/id_rsa
docker-machine env DOCKER_MACHINE_NAME
```

> Tested on ubuntu 14.04
