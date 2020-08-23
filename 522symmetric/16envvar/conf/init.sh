#! /bin/env bash
set -e
echo;echo running init.sh..

set -vx # echo on
set +vx # echo off

# -----------------------------------------
# -----------------------------------------

runinit () {

./syms/bin/symadmin --engine corp-000 create-sym-tables

#
# use this: sftp://192.168.88.60/srv/dkr/472dkrcollection/522symmetric/tutorial/symmetric-mysq4/mysql-source/docker-entrypoint-initdb.d
# rather than this..
# /app/syms/bin/dbimport --engine corp-000 --format XML --alter-case /app/conf/create_sample.xml
#

#
# create settings in SYM_ tables to define the replication
#
./syms/bin/dbimport --engine corp-000 ./conf/insert_sym_settings.sql

chmod -R ugo+rwx ./syms/db 



mkdir -p $LOCKDIR

}

# -----------------------------------------
# -----------------------------------------

function cleanup {

    echo entered cleanup - but it not needed to do anything.

}

# -----------------------------------------
# -----------------------------------------

#  start here

#
# set lock so that script will only run once..
#

# set envvar to no if not exists..
FIXINITTOHAVERUN=${FIXINITTOHAVERUN:-no}
#
LOCKDIR="/app2/_0-init-has-run-marker-directory"
#
echo f1.. ${FIXINITTOHAVERUN}
if [ "${FIXINITTOHAVERUN}" == yes ] ;  then
    echo f2.. ${FIXINITTOHAVERUN}
    mkdir -p $LOCKDIR
fi


DIR=$LOCKDIR
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "lockdir ${DIR} exists. This should mean init has already ran once. Continuing without running init..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Lockdir ${DIR} not found.. run init.sh this one time.."
    # cleanup if need be. # Works for SIGTERM and SIGINT(Ctrl-C)
    trap "cleanup" EXIT
  runinit
fi

# -----------------------------------------

echo End of init.sh.
echo;
