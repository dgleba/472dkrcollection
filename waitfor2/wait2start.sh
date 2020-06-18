#!/bin/bash

echo Starting wait2start.sh..
date
set -e

# ======================================================================
# Look at command line args..

# host="$1"
# shift
# echo host:$host  
cmd="$@"
echo   "cmd var is:  $cmd"


# ======================================================================
# example
#
# until PGPASSWORD=$POSTGRES_PASSWORD psql -h "postgres429" -U "postgres" -c '\q'; do
#   >&2 echo "Postgres is unavailable - sleeping"
#   sleep 1
# done


# ======================================================================
# Wait for two other services to be ready..

# chain to wait-for-it.. w2
# this will wait until w2 starts or -t 299 seconds max.
# it will try for -t 299 seconds. it will continue 1 second after it starts. It will fail after 299 seconds.

date
./wait-for-it.sh w2:80 -t 299 
date
echo --- --- past w2


# chain to wait-for-it.. w3
date
./wait-for-it.sh w3:80 -t 299 
date
echo --- --- --- past w3




# ======================================================================
# Try to continue to start normally now..


# exec $cmd
# exec /docker-entrypoint.sh
# exec "$@"


# Run the command in CMD in the dockerfile.

# got error regarding - off
#nginx -g daemon off;


# seems like a kludge. but works.
# nginx
# tail -f /dev/null

# try command with entrypoint in compose.

set -vx
# exec the passed in command to start things normally...
exec "$@"

