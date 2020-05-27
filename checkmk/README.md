

# checkmk 

David Gleba


# Instructions

```
cp example.env .env
edit .env
dc up
```


# troubleshooting


##  1. no emails are sending.


message in /var/log/mail.log:
```
postfix check_mk fatal valid hostname or network address required in server description
```

solution:

use no quotes in host.
```
Wrong: MAIL_RELAY_HOST='192.168.88.60'
Correct: MAIL_RELAY_HOST=192.168.88.60
```

ref. 
https://groups.google.com/forum/#!topic/mailing.postfix.users/j9lqa83ku3U  said:  please look at postconf -n



## 2. Backup path problem

error:  You have to provide a canonical path.

I provided `/omd/sites/cmk/backups`

```
root@checkmk:/# albe@vamp398:/srv/dkr/472dkrcollection/checkmk$ dc exec checkmk bash
root@checkmk:/# su cmk
OMD[cmk]:~$ ls
backup-config/  backupconfig/  backups/  bin@  etc/  include@  lib@  local/  share@  tmp/  var/  version@
OMD[cmk]:~$ cd backups
OMD[cmk]:~/backups$ ls
OMD[cmk]:~/backups$ ls -la
total 8
drwxr-sr-x  2 root root 4096 May 27 17:53 ./
drwxr-sr-x 11 cmk  cmk  4096 May 27 17:53 ../
OMD[cmk]:~/backups$ pwd
/omd/sites/cmk/backups
OMD[cmk]:~/backups$
```

solution:

I just use command line `omd backup ...`

see Makefile, make bk

