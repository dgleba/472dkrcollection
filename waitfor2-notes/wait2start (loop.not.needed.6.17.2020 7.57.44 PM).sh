#!/bin/bash
date
set -e

host="$1"
#shift
cmd="$@"
echo "cmd var is:  $cmd"


# ======================================================================
# example
#
# until PGPASSWORD=$POSTGRES_PASSWORD psql -h "postgres429" -U "postgres" -c '\q'; do
#   >&2 echo "Postgres is unavailable - sleeping"
#   sleep 1
# done


date

# chain to wait-for-it.. w2
#
#
# loop is not needed. just use large  -t 399. It will continue one second after it is up.
#
#
#
#
until ./wait-for-it.sh w2:80 -t 9 --strict -- echo w2 is up.  
do
    echo --- $(date) .. waiting for w2. 
    sleep 1
done


echo --- --- past w2
date

# chain to wait-for-it.. w3
until ./wait-for-it.sh w3:80 -t 9 --strict -- echo w3 is up.  
do
    echo --- $(date) .. waiting for w3. 
    sleep 1
done

echo --- --- --- past w3
date

