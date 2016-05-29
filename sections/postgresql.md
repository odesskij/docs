## notice
в постгре нужно давать доступы к бд линукс пользователю, в момент создания дб не обязательно указывать владельца

## install

````bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
````
## enter to sql

````bash
sudo -s
sudo -i -u postgres
psql
````

##  setup db, user

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