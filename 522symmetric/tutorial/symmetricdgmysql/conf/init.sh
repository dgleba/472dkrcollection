#! /bin/env bash
set -e
echo running init.sh

set -vx

/app/syms/bin/dbimport --engine corp-000 --format XML --alter-case /app/conf/create_sample.xml
/app/syms/bin/symadmin --engine corp-000 create-sym-tables
/app/syms/bin/dbimport --engine corp-000 /app/conf/insert_sample.sql

chmod -R ugo+rw /app/syms/db 
