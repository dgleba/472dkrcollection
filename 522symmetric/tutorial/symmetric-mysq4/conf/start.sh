#! /bin/env bash

set -e

# Start SymmetricDS
echo "Starting SymmetricDS..."

dbf=/app/syms/db 
chmod -R ugo+rw $dbf
chmod 755 $(find $dbf -type d)

exec "/app/syms/bin/sym"
