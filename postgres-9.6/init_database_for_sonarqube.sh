#!/bin/bash

# init_database_for_sonarqube

set -e

SQL=""
SQL="${SQL} CREATE DATABASE sonar;"
SQL="${SQL} CREATE USER ${SONARQUBE_JDBC_USERNAME:-sonar} SUPERUSER PASSWORD '${SONARQUBE_JDBC_PASSWORD:-sonar}';"
SQL="${SQL} GRANT ALL PRIVILEGES ON DATABASE sonar TO ${SONARQUBE_JDBC_USERNAME:-sonar};"

psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER:-user}" <<-EOSQL
    ${SQL}
EOSQL
