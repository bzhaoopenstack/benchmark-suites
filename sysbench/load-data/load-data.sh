#!/bin/bash

# threads is based on number of cpus
THDS=`nproc`

sysbench --threads=$THDS --rate=0 --report-interval=1 --db-driver=pgsql \
         --pgsql-host=$DB_HOST --pgsql-port=$DB_PORT --pgsql-db=$TEST_DB \
         --pgsql-user=$DB_USER --pgsql-password=$DB_PASSWD \
         "$SYSBENCH_INSTALL_DIR/share/sysbench/oltp_insert.lua" --tables=$TABLES --table-size=$TABLE_SIZE prepare
