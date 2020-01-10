#For Debian buster 
FROM debian:buster

RUN apt-get update && apt-get install -y vim && apt-get install -y wget
RUN wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb && dpkg -i mysql-apt-config_0.8.13-1_all.deb
RUN apt-get -y install nginx
COPY srcs/.bashrc root/

