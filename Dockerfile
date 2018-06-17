FROM postgres:9.6

RUN mkdir -p /tmp/data/
ADD *.csv /tmp/data/

ADD schema.sql /docker-entrypoint-initdb.d/
ADD script.sh /docker-entrypoint-initdb.d/
