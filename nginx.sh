#!/bin/sh
 
NGINX_VERSION=1.7.8
TMP_PATH=/tmp
 
# Fetch and extract Nginx
cd $TMP_PATH
wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz
tar xvfz nginx-$NGINX_VERSION.tar.gz
cd nginx-$NGINX_VERSION
 
# Fetch and apply the Nginx SPDY patch
#wget http://nginx.org/patches/spdy/patch.spdy.txt
#patch -p0 < patch.spdy.txt
 
# Install the latest passenger gem
sudo gem install passenger
 
# Configure passenger (with ubuntu-style paths)
sudo passenger-install-nginx-module \
  --auto \
  --languages ruby,nodejs,python \
  --nginx-source-dir=$TMP_PATH/nginx-$NGINX_VERSION \
  --prefix=/usr \
  --extra-configure-flags=" \
    --with-http_spdy_module \
    --with-http_ssl_module \
    --with-ipv6 \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/var/run/nginx.pid \
    --sbin-path=/usr/sbin \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log"
 
# Cleanup
sudo rm -r $TMP_PATH/nginx-$NGINX_VERSION
rm $TMP_PATH/nginx-$NGINX_VERSION.tar.gz

