#!/usr/bin/env bash
# https://github.com/panubo/docker-postfix 

service postfix restart
  
echo "Running command $*"
exec "$@"
