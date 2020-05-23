
======================================================================

more notes on the topic of - docker mail relay

C:\n\sfile\0computersf\0-cm-notes-01\docker.email.relay.note.txt


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-23[May-Sat]16-04PM 


# Notes

### Copy files out of container.

```

Copy files from container for viewing.

contnr=postfix-relay_mail_1
src=$contnr:/etc/postfix
out=../x/tmpcp03
mkdir -p $out
docker cp $src $out

_____________



src=debian-smpl_deb_run_4c1313d4e230:/etc/postfix
out=/srv/file/test/tmp/etcpostfix
mkdir -p $out
docker cp $src $out

_____________



cd /srv/file/test/482dkrcollection ;  rsync -a debian-mail/ debian-mail-works04 ;  cd debian-mail


`