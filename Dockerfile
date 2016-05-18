FROM ubuntu:15.10

EXPOSE 22 80

RUN apt-get update

RUN apt-get install lighttpd lighttpd-mod-magnet -y

RUN apt-get install php5-cgi php5-gd php5-mysql -y

VOLUME /etc/lighttpd/

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

