# see https://github.com/docker-library/postgres/blob/34689e2a5ba1841fb09fd5a9c29ef47a022d48dc/9.6/alpine/Dockerfile

FROM scratch

COPY --from=postgres:9.6.9-alpine / /

RUN set -ex \
  && apk add --no-cache shadow \
  && usermod -u 1000  postgres \
  && groupmod -g 1000 postgres \
  && chown -hR postgres:postgres /var/lib/postgresql

COPY ./init_database_for_sonarqube.sh /docker-entrypoint-initdb.d/init_database_for_sonarqube.sh
RUN chmod 755 /docker-entrypoint-initdb.d/init_database_for_sonarqube.sh

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data

VOLUME /var/lib/postgresql/data

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]