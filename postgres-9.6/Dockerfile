
FROM postgres:9.6.9-alpine

COPY ./init_database_for_sonarqube.sh /docker-entrypoint-initdb.d/init_database_for_sonarqube.sh
RUN chmod 755 /docker-entrypoint-initdb.d/init_database_for_sonarqube.sh
