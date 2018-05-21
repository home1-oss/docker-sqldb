# docker-postgresql
Postgres in docker

see: https://hub.docker.com/_/postgres/

A replacement for sonarqube's embedded H2 database.

`docker-compose up -d`

Create database for sonarqube

see: https://github.com/sameersbn/docker-postgresql/issues/58

`docker exec -it postgresql.local psql -U postgres -c "CREATE DATABASE sonar;"`
`docker exec -it postgresql.local psql -U postgres -c "CREATE USER sonar SUPERUSER PASSWORD 'sonar';"`
`docker exec -it postgresql.local psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;"`

or

```
psql -v ON_ERROR_STOP=1 -h postgresql.local --username "user" <<-EOSQL
    CREATE DATABASE sonar;
    CREATE USER sonar SUPERUSER PASSWORD 'sonar';
    GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;
EOSQL
```

`psql -h postgresql.local -d sonar -U sonar -W`

Backup data

`docker exec -t postgresql.local pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql`

`docker exec -t postgresql.local pg_dumpall -c -U postgres | gzip > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql.gz`

Restore data

`cat your_dump.sql | docker exec -i postgresql.local psql -U postgres`
