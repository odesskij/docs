##bower
http://hacklone.github.io/private-bower/
````nginx
server {
    listen 80;
    listen [::]:80;

    server_name bower.example.com;

    disable_symlinks off;
    client_max_body_size 500M;
    error_log  /opt/bower/log_error.log;
    access_log /opt/bower/log-access.log;

    location / {
        proxy_pass       http://localhost:5678;
        proxy_set_header Host      $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
`````

##npm
https://www.npmjs.com/package/sinopia

##composer
1. https://getcomposer.org/doc/articles/handling-private-packages-with-satis.md#satis
2. http://ludofleury.github.io/satisfy/
