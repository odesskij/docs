## install

```bash
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
```

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