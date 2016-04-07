
Установка syslog-ng: 
```bash 
sudo apt-get install syslog-ng-core && sudo apt-get install syslog-ng
```

Установка grafana:
```bash
$ wget https://grafanarel.s3.amazonaws.com/builds/grafana_2.6.0_amd64.deb
$ sudo apt-get install -y adduser libfontconfig
$ sudo dpkg -i grafana_2.6.0_amd64.deb
```

Установка и настройка influxdb:
https://docs.influxdata.com/influxdb/v0.9/introduction/installation/
```bash
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update && sudo apt-get install influxdb
sudo service influxdb start
```

После этого запускаем influx и создаем юзера и базу данных:
```bash
 CREATE DATABASE <name>
 CREATE USER <name> WITH PASSWORD '<password>' GRANT ALL PRIVILEGIES
```
Открыть:
```bash
sudo vim /etc/influxdb/influxdb.conf 
```

Заменяем следующие блоки:
```bash
[http]
  enabled = true
  bind-address = ":8086"
  auth-enabled = true
  log-enabled = true
  write-tracing = false
  pprof-enabled = false
  https-enabled = false
  https-certificate = "/etc/ssl/influxdb.pem"
  max-row-limit = 10000


[[udp]]
enabled = true
  bind-address = ":9999" # the bind address
  database = "logs" # Name of the database that will be 

  batch-size = 1000 # will flush if this many points get buffered
  batch-timeout = "1s" # will flush at least this often even if the batch-size is not reached
  batch-pending = 5 # number of batches that may be pending in memory
  read-buffer = 0 # UDP Read buffer size, 0 means OS default.

```

Настраиваем syslog-ng:
Открываем:
```bash
  sudo vim /etc/syslog-ng/syslog-ng.conf
```
Приводим файл к такому виду:
```bash
@version: 3.5
@include "scl.conf"
@include "`scl-root`/system/tty10.conf"

# Syslog-ng configuration file, compatible with default Debian syslogd
# installation.

# First, set some global options.
options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
	  owner("root"); group("adm"); perm(0640); stats_freq(0);
	  bad_hostname("^gconfd$");
};

########################
# Sources
########################
# This is the default behavior of sysklogd package
# Logs may come from unix stream, but not from another machine.
#

source nginx_local {udp(ip(127.0.0.1) port(514) tags("nginx"));};

destination influx_local {
 udp("127.0.0.1" port(9999) template("${MSG}"));
};
destination d_access { file("/var/log/access.log" template("${MSG}")); };

log {source(nginx_local); destination(influx_local);};
log {source(nginx_local); destination(d_access);};

###
# Include all config files in /etc/syslog-ng/conf.d/
###
@include "/etc/syslog-ng/conf.d/*.conf"
```


Настраиваем сервер grafana:
```bash
server {
    listen      80;
    server_name YOUR_AWSOME_DOMAIN;

    location / {
        root /home/www-lp/www;
        proxy_pass       http://127.0.0.1:3000;
        proxy_set_header Host      $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

Настраиваем админку nflux
```bash

server {
    listen 80;
    server_name YOUR_AWSOME_DOMAIN;

    access_log /var/log/nginx/inluxaccess.log;
    error_log /var/log/nginx/influxerror.log;

    location / {
        proxy_pass       http://localhost:8083;
    }
}

```

Основные настройки  nginx.conf:

```bash
user  nginx;
worker_processes  10;

pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    map $args $ercode {   #из-за гребаной черточки в "error-code" приходится доставать его таким образом
       default 0;
       "~error-code=(?<p>.*)" $p;
    }

    log_format  main  'req,error_code="$ercode" remote_addr="$remote_addr",remote_user="$remote_user",time_local="$time_local",request="$request",'
                      'http_referer="$http_referer",request_time="$request_time",'
                      'http_user_agent="$http_user_agent",http_x_forwarded_for="$http_x_forwarded_for",'
                      'query="$query_string",error_code="$ercode",msisdn="$arg_msisdn",uri="$uri"';




   #log_format main 'request="$request", isArgs="$is_args", msisdn="$arg_msisdn", error-code="$arg_{error-code}"';

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/sites-enabled/*;
}
```
