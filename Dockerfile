FROM php:7.2-apache
RUN mkdir -p /var/www/html
COPY . /var/www/html
WORKDIR /var/www/html
RUN docker-php-ext-install -j$(nproc) mysqli pdo pdo_mysql
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
EXPOSE 400
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install vim
RUN apt install -y apache2