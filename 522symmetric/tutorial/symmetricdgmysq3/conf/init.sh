#! /bin/env bash
set -e
echo running init.sh

set -vx

/app/syms/bin/symadmin --engine corp0 create-sym-tables

# /app/syms/bin/dbimport --engine corp-000 --format XML --alter-case /app/conf/create_sample.xml
/app/syms/bin/dbimport --engine corp0 /app/conf/insert_itemdb.sql

chmod -R ugo+rwx /app/syms/db 
