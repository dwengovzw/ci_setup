FROM alpine:latest
ENV server_name=blockly-staging.dwengo.org
RUN apk add --no-cache apache2
RUN apk add openrc
RUN rm -rf /var/www/localhost/cgi-bin/
CMD exec /usr/sbin/httpd -D FOREGROUND -f /etc/apache2/httpd.conf


