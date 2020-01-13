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
RUN apt-get install -y php7.3  php7.3-fpm php7.3-mbstring php7.3-mysql 

#For Mysql install 
RUN wget http://repo.mysql.com/mysql-apt-config_0.8.14-1_all.deb \
		&& apt-get install -y gnupg \
		&& apt-get install -y lsb-release \
		&& dpkg -i mysql-apt-config_0.8.14-1_all.deb \
		&& apt-get update \
		&& apt-get install -y mysql-server 

#For WordPress Download 
RUN wget -P /var/www/html/ https://wordpress.org/latest.zip \
	&& unzip /var/www/html/latest.zip -d /var/www/html/ \
	&& cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php \
	&& rm -rf /var/www/html/latest.zip

#CP the .bashrc to the container for autorun
#COPY srcs/.bashrc root/

ENTRYPOINT /etc/init.d/nginx start \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& /etc/init.d/mysql start \
	&& /etc/init.d/php7.3-fpm start \
	&& /bin/bash




