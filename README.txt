# Server:

## Update
apt-get update; apt-get dist-upgrade

cat ./.bashrc > ~/.bashrc
cat ./.bashrc > /etc/skel/.bashrc

## Locales
#vim /var/lib/locales/supported.d/local
#ru_UA.UTF-8 UTF-8
echo "ru_UA.UTF-8 UTF-8" > /var/lib/locales/supported.d/local

#vim /var/lib/locales/supported.d/en
#en_US.UTF-8 UTF-8
echo "en_US.UTF-8 UTF-8" > /var/lib/locales/supported.d/en

vim /etc/default/locale
LANG="ru_UA.UTF-8"
LANGUAGE="ru_UA:ru"
LC_ALL="ru_UA.UTF-8"

rm -rfv /usr/lib/locale/*
locale-gen
reboot

-------------------------------------

## System
apt-get update && apt-get install htop mc iotop vim git curl mysql-server redis-server python-software-properties libcurl4-openssl-dev build-essential
apt-add-repository ppa:brightbox/ruby-ng
apt-get update
apt-get install php5-fpm php5-cli php-apc php5-mcrypt php5-gd php5-intl php5-curl php5-imagick php5-mysql ruby2.2 ruby2.2-dev ruby ruby-switch

ruby-switch --set ruby2.2
ruby --version

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

## Nginx
chmod +x nginx.sh && ./nginx.sh

cat ./nginx.conf > /etc/nginx/nginx.conf
cat ./fastcgi_common > /etc/nginx/fastcgi_common
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled

cat ./init-d_nginx > /etc/init.d/nginx
chmod +x /etc/init.d/nginx
update-rc.d nginx defaults

cat ./init-php5-fpm.conf > /etc/init/php5-fpm.conf

service nginx restart
service php5-fpm restart

-------------------------------------

## System Users
adduser --disabled-password www-pma

## Nginx virtual host
vim /etc/nginx/sites-available/pma
ln -sv /etc/nginx/sites-available/pma /etc/nginx/sites-enabled/pma

## php5-fpm pool
vim /etc/php5/fpm/pool.d/pma.conf

## php mods
php5enmod mcrypt

service php5-fpm restart
service nginx restart

-------------------------------------

## MYSQL
CREATE DATABASE DATABASE_NAME;

CREATE USER 'USER'@'localhost' IDENTIFIED BY 'PASSWORD';
GRANT ALL PRIVILEGES ON DATABASE_NAME.* TO 'USER'@'localhost';
FLUSH PRIVILEGES;

vim ~/.my.cnf
[client]
user=USER
password=PASSWORD

-------------------------------------

gem install sass --user-install
add-apt-repository ppa:webupd8team/java && apt-get update && apt-get install oracle-java8-installer && java -version

------------------------------------
adduser --disabled-password www-pma
sudo su - www-pma
git clone https://github.com/phpmyadmin/phpmyadmin.git www
vim /etc/nginx/sites-available/pma
server {
    listen 80;
    listen [::]:80;

    server_name pma.finbid.net;
    root /home/www-pma/www;

    disable_symlinks off;
    client_max_body_size 500M;
    error_log  /var/log/nginx/pma-error.log;
    access_log /var/log/nginx/pma-access.log;

    location / {
        try_files $uri /index.php$is_args$args;
    }

    location ~ \.php$ {
       fastcgi_pass unix:/var/run/pma.sock;
       include fastcgi_common;
    }
}

ln -sv /etc/nginx/sites-available/pma /etc/nginx/sites-enabled/pma

vim /etc/php5/fpm/pool.d/pma.conf 
[pma]
prefix = /home/www-$pool
user = www-$pool
group = www-$pool
listen = /var/run/$pool.sock

listen.owner = root
listen.group = www-data
listen.mode = 0666

pm = dynamic
pm.max_children = 100
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3

chdir = /


service php5-fpm restart
service nginx restart

------------------------------------
## Fish
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get install fish 
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
````
...

# Theme
set fish_theme ocean
...
````
