#!/bin/bash

THDS=$1
TIME=$2
TC=$3

sysbench --threads=$THDS --time=$TIME --rate=0 --report-interval=5 --db-driver=pgsql --rand-type=uniform \
         --pgsql-host=$DB_HOST --pgsql-port=$DB_PORT --pgsql-db=$TEST_DB \
         --pgsql-user=$DB_USER --pgsql-password=$DB_PASSWD \
         $TC --tables=$TABLES --table-size=$TABLE_SIZE run
