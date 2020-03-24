#!/bin/bash

# threads is based on number of cpus
THDS=`nproc`

# warm-up should run readonly workload to load pages into memory/buffer-pool.

sysbench --threads=$THDS --time=$1 --rate=0 --report-interval=5 --db-driver=pgsql --rand-type=uniform \
         --pgsql-host=$DB_HOST --pgsql-port=$DB_PORT --pgsql-db=$TEST_DB \
         --pgsql-user=$DB_USER --pgsql-password=$DB_PASSWD \
         "$SYSBENCH_INSTALL_DIR/share/sysbench/oltp_read_only.lua" --tables=$TABLES --table-size=$TABLE_SIZE run
