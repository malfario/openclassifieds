FROM kotsios/env:latest
MAINTAINER Rafa Leblic <rleblic@gmail.com>

RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/mysql /var/run/postfix /var/log/supervisor

RUN sudo chmod 755 /var/www/html/*
RUN sudo chmod 755 /var/www/*
RUN sudo chown -R www-data:www-data /var/www/html*
RUN sudo chown -R www-data:www-data /var/www/*

RUN sudo service apache2 stop

COPY supervisord.conf /etc/supervisor/conf.d/
COPY supervised_mysql /usr/sbin/
COPY postfix.sh /opt/

RUN sudo rm -f /var/www/html/index.php

EXPOSE 80
VOLUME ["/var/lib/mysql", "/var/log/mysql"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
