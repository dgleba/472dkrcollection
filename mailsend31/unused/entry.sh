#!/bin/bash

tee /etc/ssmtp/ssmtp.conf <<HEREDOC
hostname=mail.local
mailhub=smtp-mail.outlook.com:587
root=$muname
AuthUser=$muname
AuthPass=$mupw
AuthMethod=LOGIN
UseSTARTTLS=YES
UseTLS=YES
rewriteDomain=outlook.com
FromLineOverride=YES
HEREDOC
cat /etc/ssmtp/ssmtp.conf
  
echo "Running command $*"
exec "$@"
