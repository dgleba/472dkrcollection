#! /bin/env bash
set -e
echo;echo running first load .sh..

set -vx

# -----------------------------------------
# -----------------------------------------

firstload () {


#
# initial load of data from corp to store1
#
while [ $i -lt 50 ]
do
  echo "Number: $i"
  ((i++))
  echo sleeping about 20s before running store1 initial data load with - corp-000 reload-node 001 ..
  sleep 20
  /app/syms/bin/symadmin --engine corp-000 reload-node 001 | tee /app/symadmin-output.txt
  echo exited with .. $?
  if grep -q "Successfully" /app/symadmin-output.txt;  then
    break
  fi
done


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
# set lock so that script will only run one instance..
#

LOCKDIR="/app/0-first-data-load_has-run-marker-directory"

DIR=$LOCKDIR
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "lockdir ${DIR} exists. This should mean it has already run once. exiting without running init..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Lockdir ${DIR} not found.. run init.sh this one time.."
    # cleanup if need be. # Works for SIGTERM and SIGINT(Ctrl-C)
    trap "cleanup" EXIT
  firstload
fi

# -----------------------------------------

echo End of first load .sh.
echo;
