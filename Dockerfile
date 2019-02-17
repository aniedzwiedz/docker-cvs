FROM alpine:latest

RUN apk update
RUN apk add cvs openssl busybox-extras

ADD files/inetd.conf /etc/inetd.conf
ADD files/run.sh /

RUN chmod +x run.sh

RUN echo "cvspserver 2401/tcp" >> /etc/services

RUN mkdir /var/cvsroot
RUN addgroup -g 1002 cvs; adduser -G cvs cvs  -D; passwd cvs -d cvs
RUN chown -R :cvs /var/cvsroot
RUN chmod -R g+ws /var/cvsroot
RUN chgrp -R cvs /var/cvsroot/

VOLUME ["/var/cvsroot"]

ENV CVS_USER cvs
ENV CVS_PASSWD cvs

CMD ["/run.sh"]
