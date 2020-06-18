#!/bin/bash
date
set -e

host="$1"
# shift
cmd="$@"
echo host:$host      "cmd var is:  $cmd"


# ======================================================================
# example
#
# until PGPASSWORD=$POSTGRES_PASSWORD psql -h "postgres429" -U "postgres" -c '\q'; do
#   >&2 echo "Postgres is unavailable - sleeping"
#   sleep 1
# done



# chain to wait-for-it.. w2
# this will wait until w2 starts or -t 299 seconds max.
date
./wait-for-it.sh w2:80 -t 299 --
date
echo --- --- past w2


# chain to wait-for-it.. w3
date
./wait-for-it.sh w3:80 -t 299 --  
date
echo --- --- --- past w3

set -vx
# exec $cmd
# exec /docker-entrypoint.sh
# exec "$@"

# got error regarding - off
#nginx -g daemon off;

# seems like a kludge. but works.
nginx
tail -f /dev/null