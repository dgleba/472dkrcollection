#!/usr/bin/env bash
# https://github.com/panubo/docker-postfix

# set -e
# [ "${DEBUG:-false}" == 'true' ] && set -x


# sed -i "/nameserver.*/i nameserver 8.8.8.8"  /etc/resolv.conf 
# cat /etc/resolv.conf | sed "/nameserver.*/i nameserver 8.8.8.8"> /tmp/tmpflb 
# cp /tmp/tmpflb /etc/resolv.conf


# sed -i "/MAILER_DEF.*/i define(`SMART_HOST',`[MESG01.stackpole.ca]')dnl"  /etc/mail/sendmail.mc \
# sed -i "/MAILER_DEF.*/i define('SMART_HOST','MESG01.stackpole.ca')dnl"  /etc/mail/sendmail.mc \
  # && make -C /etc/mail 
  # && /etc/init.d/sendmail reload

# sendmail slow to load. put this line first in /etc/hosts
# https://www.linuxquestions.org/questions/linux-general-1/sendmail-takes-forever-to-start-up-143704/
#  line=$(head -n 1 /etc/hosts) \
#   && line2=$(echo $line | awk '{print $2}') 
#  cp -a /etc/hosts /tmp/tmphosts
#  echo " pmdsdata7-dkr-01.local $line $line2.localdomain" >> /etc/hosts 
#  #  cat /tmp/tmphosts >> /etc/hosts


#  echo "pmdsdata7-dkr-01.local" > /etc/hostname 

service postfix restart
  
echo "Running command $*"
exec "$@"
