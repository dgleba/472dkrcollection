#! /bin/env bash

set -e

# Start SymmetricDS
echo "Starting SymmetricDS..."

# make scripts and folders executable (folders need to be executable to cd into them)
find . -iname "*.sh" -exec bash -c 'chmod +x "$0"' {} \;
chmod ugo+x $(find . -type d)

# make db folder readable on host..
dbf=/app/syms/db 
chmod -R ugo+rw $dbf
chmod 755 $(find $dbf -type d)


# init.sh will only run once. a marker directory is created after it runs.
source /app/conf/init.sh

exec /app/syms/bin/sym

# cant figure out how to call this after above commmand.. -- exec /app/conf/initial-data-load.sh
