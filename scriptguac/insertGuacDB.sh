#! /bin/bash

sudo docker run -it --link hyeok-mysql:mysql --rm mysql sh -c 'exec echo "create database guacamole;" | mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
sudo docker run -it --link hyeok-mysql:mysql -v /home/forhack/scriptguac:/home --rm mysql sh -c 'exec cat /home/guacdb.sql | mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" guacamole'
