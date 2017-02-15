FROM turgon37/armhf-alpine:latest
MAINTAINER Pierre GINDRAUD <pgindraud@gmail.com>

ARG BUILD_TIME

LABEL image.build.time=$BUILD_TIME

ENV GOSU_VERSION=1.9

RUN apk add --no-cache mariadb mysql-client pwgen

RUN set -x && \
    apk add --no-cache --virtual .gosu-deps dpkg gnupg openssl && \
    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" && \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" && \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" && \
    export GNUPGHOME="$(mktemp -d)" && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu && \
    rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc && \
    chmod +x /usr/local/bin/gosu && \
    gosu nobody true && \
    apk del .gosu-deps

RUN sed -ri 's/^user\s/#&/' /etc/mysql/my.cnf && \
    sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf && \
    rm -rf /var/lib/mysql && \
    mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY entrypoint /sbin/entrypoint

VOLUME ["/var/lib/mysql"]
EXPOSE 3306/tcp

ENTRYPOINT ["entrypoint"]
CMD ["mysqld"]
