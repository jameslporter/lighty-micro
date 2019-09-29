FROM ubuntu

EXPOSE 22 80

RUN apt-get update

RUN apt-get install lighttpd lighttpd-mod-magnet -y

RUN apt-get install php-cgi php-gd php-mysql php-curl -y

COPY lighttpd /etc/lighttpd/

RUN mkdir /var/run/lighttpd

RUN chown www-data /var/run/lighttpd

RUN mkdir /var/www/sites/

COPY certs/* /usr/local/share/ca-certificates/
RUN update-ca-certificates

VOLUME /var/www/sites

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

