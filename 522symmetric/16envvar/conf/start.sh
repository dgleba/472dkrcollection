#! /bin/env bash

set -e

# Start SymmetricDS
echo "Starting SymmetricDS..."

# make scripts and folders executable (folders need to be executable to cd into them)
find . -iname "*.sh" -exec bash -c 'chmod +x "$0"' {} \;
chmod ugo+x $(find . -type d)


#
# I cannot figure another way to use env vars for engine properties files. So this silly way is being used..
#
source ./conf/corp-000-prop.write.sh
source ./conf/store-001-prop.write.sh


# init.sh will only run once. a marker directory is created after it runs.
source ./conf/init.sh



# make db folder readable on host..
dbf=./syms/db 
chmod -R ugo+rw $dbf
chmod 755 $(find $dbf -type d)

d=/app2
chmod -R ugo+rw $d; chown -R 1000:33 $d


exec ./syms/bin/sym 
# I tried to get a web page of some sort.. No luck..  -- exec /app/syms/bin/sym --port 8080 --server

# cant figure out how to call this after above commmand.. -- exec /app/conf/initial-data-load.sh
