# see https://github.com/docker-library/mariadb/blob/master/10.2/Dockerfile

FROM debian:jessie

COPY --from=mariadb:10.2.16 / /

RUN set -ex \
  && usermod -u 1000  mysql \
  && groupmod -g 1000 mysql \
  && find -user 999 -path "/proc" -prune -exec chown mysql:mysql {} ";"

VOLUME /var/lib/mysql
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3306
CMD ["mysqld"]