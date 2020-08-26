#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  backup indiv dbs except those in exclude list..

usage: 

 see makefile


END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

main1()
{
  TIMESTAMP=$(date +"%F")

  BACKUP_DIR="/home"

  MYSQL_USER="root"
  # see below..  MYSQL_PASSWORD="$mysqlrootpassw"

  MYSQL=/usr/bin/mysql
  MYSQLDUMP=/usr/bin/mysqldump

  mkdir -p "$BACKUP_DIR"
   
  databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_ROOT_PASSWORD -e "SHOW DATABASES;" | grep -Ev \
   "(Database|cmmdb|greygold|prodrptdb_archive|argo|test|ignition|rail_test)"`   # see exclude list to the left on this line.
   
  echo $databases 

  for db in $databases; do
    echo "${db}"
    
    $MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_ROOT_PASSWORD    --databases "${db}" --complete-insert --quote-names   \
       --skip-add-drop-table --add-drop-database  --skip-lock-tables   --routines \
       --events  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/"${db}"_mysqldump.sql"
    # Be CAREFUL with the all options...      --no-tablespaces --no-create-info --allow-keywords
       
    # -d = structure only all tables
    $MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_ROOT_PASSWORD -d --databases "${db}" --complete-insert --quote-names  --allow-keywords \
       --add-drop-database  --skip-lock-tables   --routines \
       --events  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/"${db}"_struc_mysqldump.sql"
       
       
  done
}


main1
#
date
#
