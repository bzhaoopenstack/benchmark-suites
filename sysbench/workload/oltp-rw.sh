#!/bin/bash

THDS=$1
TIME=$2
TC="$SYSBENCH_INSTALL_DIR/share/sysbench/oltp_read_write.lua"

./workload/run.sh $THDS $TIME $TC
