## repository

```bash
. /etc/lsb-release
echo -e "deb http://nginx.org/packages/mainline/ubuntu/ $DISTRIB_CODENAME nginx\ndeb-src http://nginx.org/packages/mainline/ubuntu/ $DISTRIB_CODENAME nginx" > /etc/apt/sources.list.d/nginx-mainline.list
curl http://nginx.org/keys/nginx_signing.key > /tmp/nginx_signing.key
apt-key add /tmp/nginx_signing.key
apt-get update
```

## install nginx

```bash
apt-get install -y nginx
```

> Tested on ubuntu 14.04