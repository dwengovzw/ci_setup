FROM alpine:latest
LABEL author="Tom Neutens"
ENV server_name=localhost
RUN set -x \
    && apk update && apk upgrade \
    && apk add apache2 apache2-proxy
RUN apk add --no-cache apache2-ssl
RUN rm -rf /var/www/localhost/cgi-bin/
CMD exec /usr/sbin/httpd -D FOREGROUND -f /etc/apache2/httpd.conf