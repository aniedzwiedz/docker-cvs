FROM alpine:latest

RUN apk update
RUN apk add cvs openssl busybox-extras

ADD files/inetd.conf /etc/inetd.conf
ADD files/run.sh /

RUN chmod +x run.sh

RUN echo "cvspserver 2401/tcp" >> /etc/services

RUN mkdir /var/cvsroot
RUN addgroup -g 1002 fcu; adduser -G fcu fcu  -D; passwd fcu -d fcu
RUN chown -R :fcu /var/cvsroot
RUN chmod -R g+ws /var/cvsroot
RUN chgrp -R fcu /var/cvsroot/

VOLUME ["/var/cvsroot"]

ENV CVS_USER fcu
ENV CVS_PASSWD fcu

CMD ["/run.sh"]
