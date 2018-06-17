#!/bin/bash

DATABASE_NAME="bootstrap"
ROLE_NAME="bootstrap"

for x in $(ls /tmp/data/customers.csv);
do psql -d "$DATABASE_NAME" -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres -c "COPY customers(id,email,first_name,last_name) FROM '$x' DELIMITERS ',' CSV HEADER;"; done
echo "*** CUSTOMERS DATA IMPORT COMPLETE ***"

for x in $(ls /tmp/data/orders.csv);
do psql -d "$DATABASE_NAME" -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres -c "COPY orders(id,customer_id,amount) FROM '$x' DELIMITERS ',' CSV HEADER;"; done
echo "*** ORDERS DATA IMPORT COMPLETE ***"