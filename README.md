# docker-mysql
MySQL in docker

## Allow root user from any host
```sh
docker exec -it mysql.internal bash
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root_pass';
FLUSH PRIVILEGES;
```

## Create database

Create and grant access
```sh
mysql --host=mysql.internal --port=3306 --user=root --password=root_pass <<EOF
CREATE DATABASE IF NOT EXISTS `oss-configserver`
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
#CREATE USER 'user'@'%' IDENTIFIED BY 'user_pass';
#GRANT ALL PRIVILEGES ON oss-configserver.* TO 'user'@'%';
GRANT ALL PRIVILEGES ON `oss-configserver`.* TO 'user'@'%' IDENTIFIED BY 'user_pass';
FLUSH PRIVILEGES;
EOF
```

Test
```sh
mysql --host=mysql.internal --port=3306 --user=user --password=user_pass oss-configserver -e 'SELECT DATABASE();'
```

## Create tables
```sh
mysql --host=mysql.internal --port=3306 --user=user --password=user_pass db < schema-mysql.sql
```

## Backup
```sh
docker run --rm --link ${container}:db mysql:5.6.31 mysqldump -u${username} -p${password} -hdb ${dbname} >backup/$(date +%Y%m%d-%H%M)-${dbname}.sql
```
