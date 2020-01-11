#For Debian buster 
FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
RUN echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | debconf-set-selections


RUN apt-get update && apt-get install -y vim && apt-get install -y wget
RUN apt-get -y install nginx
RUN wget http://repo.mysql.com/mysql-apt-config_0.8.14-1_all.deb \
	&& apt-get install -y gnupg \
	&& apt-get install -y lsb-release \
	&& dpkg -i mysql-apt-config_0.8.14-1_all.deb \
	&& apt-get update \
	&& apt-get install -y mysql-server
#COPY srcs/.bashrc root/

