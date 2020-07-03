#! /bin/env bash
set -e
echo running init.sh

set -vx

/app/syms/bin/symadmin --engine corp-000 create-sym-tables

# use this: sftp://192.168.88.60/srv/dkr/472dkrcollection/522symmetric/tutorial/symmetric-mysq4/mysql-source/docker-entrypoint-initdb.d
# rather than this..
# /app/syms/bin/dbimport --engine corp-000 --format XML --alter-case /app/conf/create_sample.xml

/app/syms/bin/dbimport --engine corp-000 /app/conf/insert_itemdb.sql

chmod -R ugo+rwx /app/syms/db 
