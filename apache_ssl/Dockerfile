FROM alpine:latest
LABEL author="Tom Neutens"
ENV server_name=blockly-staging.dwengo.org
RUN set -x \
    && apk update && apk upgrade \
    && apk add apache2 apache2-proxy apache2-ssl
RUN apk add --no-cache apache2-ssl
RUN rm -rf /var/www/localhost/cgi-bin/
CMD exec /usr/sbin/httpd -D FOREGROUND -f /etc/apache2/httpd.conf


#FROM php:7.1-apache
#RUN apt-get update && \
#    apt-get install -y \
#        zlib1g-dev net-tools certbot python3-certbot-apache nano
#EXPOSE 80
#EXPOSE 443
##RUN docker-php-ext-install zip mbstring
#RUN a2enmod rewrite
#RUN a2enmod proxy
#RUN a2enmod headers
#RUN a2enmod ssl
#RUN a2enmod proxy_http
##RUN bash
#RUN service apache2 restart