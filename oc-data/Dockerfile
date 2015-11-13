FROM busybox
MAINTAINER Rafa Leblic <rleblic@gmail.com>

RUN mkdir -p /var/lib/mysql
WORKDIR /var/lib/mysql
COPY mysql/ .
RUN chown -R 102:106 ib* mysql openclassifieds performance_schema

VOLUME ["/var/lib/mysql"]
CMD ["/bin/true"]
