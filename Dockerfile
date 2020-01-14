#For Debian buster pull 
FROM debian:buster

#Enable Noninteractive mode && preconfig mysql select
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | debconf-set-selections

#For Update & vim install & wget install
RUN apt-get update \
	&& apt-get install -y vim \
	&& apt-get install -y wget \
	&& apt-get install -y unzip

#For Nginx install
RUN apt-get -y install nginx

#For PHP install
RUN apt-get install -y php7.3 php7.3-common php7.3-mbstring php7.3-fpm php7.3-mysql 

#For Mysql install 
RUN wget http://repo.mysql.com/mysql-apt-config_0.8.14-1_all.deb \
	&& apt-get install -y gnupg \
	&& apt-get install -y lsb-release \
	&& dpkg -i mysql-apt-config_0.8.14-1_all.deb \
	&& apt-get update \
	&& apt-get install -y mysql-server 

#For PhpMyAdmin install & config
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
	&& tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
	&& mv phpMyAdmin-4.9.0.1-all-languages /usr/share/phpMyAdmin

#For WordPress Download 
RUN wget -P /var/www/ https://wordpress.org/latest.zip \
	&& unzip /var/www/latest.zip -d /var/www/ \
	&& rm -rf /var/www/latest.zip

#Change wp-config.php in a pre-configured wp-config.php
ADD srcs/wp-config.php /var/www/wordpress/wp-config.php
ADD srcs/db_setup.sh /tmp/
ADD srcs/wordpress.sql /tmp/
ADD srcs/default /etc/nginx/sites-available/
ADD srcs/config.inc.php /usr/share/phpMyAdmin/
ADD srcs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
ADD srcs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

ENTRYPOINT /etc/init.d/nginx start \
	&& /etc/init.d/php7.3-fpm start\
	&& chown -R mysql:mysql /var/lib/mysql \
	&& /etc/init.d/mysql start \
	&& sh /tmp/db_setup.sh \
	&& mysql < /usr/share/phpMyAdmin/sql/create_tables.sql -u root \
	&& mysql < /tmp/wordpress.sql -u root wordpress \
	&& mkdir /usr/share/phpMyAdmin/tmp \
	&& chmod 777 /usr/share/phpMyAdmin/tmp \
	&& /bin/bash




