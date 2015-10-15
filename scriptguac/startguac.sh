#! /bin/bash
sudo docker run --name hyeok-guacd -d -p 4822:4822 glyptodon/guacd:0.9.8
sudo docker run --name hyeok-guacamole	\
    --link hyeok-guacd:guacd		\
    --link hyeok-mysql:mysql		\
    -e MYSQL_DATABASE=guacamole		\
    -e MYSQL_USER=root			\
    -e MYSQL_PASSWORD=wptjfdk		\
    -d -p 8080:8080 glyptodon/guacamole:0.9.8
