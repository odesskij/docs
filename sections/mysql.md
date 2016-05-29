## install mysql

```bash
MYSQL_USER=root
MYSQL_PASSWORD=$(pwgen -1 40)
echo "mysql-server-5.6 mysql-server/root_password password $MYSQL_PASSWORD" | debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password $MYSQL_PASSWORD" | debconf-set-selections
apt-get install -y mysql-server

echo -e "[client]\nuser=$MYSQL_USER\npassword=$MYSQL_PASSWORD" > ~/.my.cnf
```

## .my.cnf

```bash
echo -e "[client]\nuser=USER\npassword=PASSWORD" > ~/.my.cnf
```

## create user and database

````sql
#database
CREATE DATABASE `DATABASE_NAME` CHARACTER SET utf8 COLLATE utf8_general_ci;

#user
CREATE USER 'USER'@'localhost' IDENTIFIED BY 'PASSWORD';

#privileges
GRANT ALL PRIVILEGES ON DATABASE_NAME.* TO 'USER'@'localhost';
FLUSH PRIVILEGES;
````

## tips

```bash
MYSQL_USER=user
MYSQL_PASSWORD=$(pwgen -1 40)
MYSQL_DATABASE=database
echo -e "[client]\nuser=$MYSQL_USER\npassword=$MYSQL_PASSWORD" > /home/$MYSQL_USER/.my.cnf

echo "CREATE DATABASE \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql
echo "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'localhost';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

```


> Tested on ubuntu 14.04