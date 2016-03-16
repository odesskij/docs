# Remote:

## Update
````bash
apt-get update && apt-get dist-upgrade
````
## bash
````bash
cat ./.bashrc > ~/.bashrc
cat ./.bashrc > /etc/skel/.bashrc
````
## Locales
````bash
echo "ru_UA.UTF-8 UTF-8" > /var/lib/locales/supported.d/local
echo "en_US.UTF-8 UTF-8" > /var/lib/locales/supported.d/en
echo -e "LANG=\"ru_UA.UTF-8\"\n\
LANGUAGE=\"ru_UA:ru\"\n\
LC_ALL=\"ru_UA.UTF-8\"" > /etc/default/locale
rm -rfv /usr/lib/locale/*
locale-gen
#reboot
````
-------------------------------------

## System
###Common
````bash
apt-get update && apt-get install htop mc iotop vim git curl mysql-server redis-server python-software-properties libcurl4-openssl-dev build-essential
````
###php5
````bash
apt-get install php5-fpm php5-cli php-apc php5-mcrypt php5-gd php5-intl php5-curl php5-imagick php5-mysql
````
####php5-fpm
````bash
cat ./init-php5-fpm.conf > /etc/init/php5-fpm.conf
service php5-fpm restart
````
####composer
````bash
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
````
####php-mods
`````bash
php5enmod mcrypt
service php5-fpm restart
`````

###ruby
````bash
apt-add-repository ppa:brightbox/ruby-ng
apt-get update
apt-get install ruby2.2 ruby2.2-dev ruby ruby-switch
ruby-switch --set ruby2.2
ruby --version
````
####gems
````bash
gem install sass --user-install
````

##nginx
````bash
chmod +x nginx.sh && ./nginx.sh #compile nginx with passenger support

cat ./nginx.conf > /etc/nginx/nginx.conf
cat ./fastcgi_common > /etc/nginx/fastcgi_common
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled

cat ./init-d_nginx > /etc/init.d/nginx
chmod +x /etc/init.d/nginx
update-rc.d nginx defaults
service nginx restart
````
## phpmyadmin
````bash
adduser --disabled-password www-pma
sudo su - www-pma
git clone https://github.com/phpmyadmin/phpmyadmin.git www

# php5-fpm
vim /etc/php5/fpm/pool.d/pma.conf
# nginx virtual host
vim /etc/nginx/sites-available/pma
ln -sv /etc/nginx/sites-available/pma /etc/nginx/sites-enabled/pma
service nginx restart
service php5-fpm restart
````

/etc/nginx/sites-available/pma:
````nginx
server {
    listen 80;
    listen [::]:80;

    server_name pma.example.com;
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
````

/etc/php5/fpm/pool.d/pma.conf:
````
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
````

##mysql
````sql
#database
CREATE DATABASE `DATABASE_NAME` CHARACTER SET utf8 COLLATE utf8_general_ci;

#user
CREATE USER 'USER'@'localhost' IDENTIFIED BY 'PASSWORD';

#privileges
GRANT ALL PRIVILEGES ON DATABASE_NAME.* TO 'USER'@'localhost';
FLUSH PRIVILEGES;
````
###.my.cnf
````bash
echo -e "[client]\n\
user=USER\n\
password=PASSWORD" > ~/.my.cnf
````

##postgres
в постгре нужно давать доступы к бд линукс пользователю, в момент создания дб не обязательно указывать владельца

####install
````bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
````
####enter to sql
````bash
sudo -s
sudo -i -u postgres
psql
````
####setup db, user
````sql
#database
CREATE DATABASE "DATABASE_NAME_HERE" WITH OWNER = USERNAMEHERE ENCODING = 'UTF8';

#user
#USERNAMEHERE - www-имя-учётки-линукс
CREATE USER "USERNAMEHERE" WITH PASSWORD 'PASSWORD';

#privileges
GRANT ALL PRIVILEGES ON DATABASE "DATABASE_NAME" to "USERNAMEHERE";

#exit
\q
````

## Nodejs 

> nodejs distributions
> https://github.com/nodesource/distributions

### 5.x
````bash
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs
````

### 4.x
````bash
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### PM2 daemon

#### Latest node

````bash
node -v
sudo npm install n -g
sudo n latest
exit
node -v
```
#### PM2
```bash
sudo npm install -g pm2
pm2 status

sudo service --status-all
cd /etc/init.d
sudo touch pm2.toy
sudo chmod 755 pm2.toy
vim pm2.toy
```
As source get file  [pm2.daemon.example](https://raw.githubusercontent.com/odesskij/docs/master/pm2.daemon.example) and change lines: 
```txt
 USER
 export PM2_HOME="/home/www-eventbox/.pm2"
```
than
```bash
sudo update-rc.d pm2.toy defaults
sudo service --status-all
sudo service pm2.toy start
sudo service pm2.toy status
```
