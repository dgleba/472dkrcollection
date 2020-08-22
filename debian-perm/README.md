
# Purpose:

test changing permissions using container


# Idea:

- start it up, 
- run bash permsh. 
- see that permissions are changed on /t1 and that it can be removed or edited using the host linux user.


## Commands:

```
docker-compose up -d

albe@pmdsdata7:/srv/file/test/472dkrcollection/debian$ ll
total 36
drwxrwsrwx  3 albe www-data 4096 Aug 21 16:18 .
drwxr-sr-x  2 root www-data 4096 Aug 21 16:18 t1


albe@pmdsdata7:/srv/file/test/472dkrcollection/debian$ bash permsh
uid=1000(albe) gid=1000(albe) groups=1000(albe),4(adm),20(dialout),24(cdrom),27(sudo),30(dip),33(www-data),46(plugdev),110(lxd),115(lpadmin),116(sambashare),119(docker),999(mysql),1003(ftpup),1005(recovery),1007(edgecom)
uid=1000


albe@pmdsdata7:/srv/file/test/472dkrcollection/debian$ ll
total 36
drwxrwsrwx  3 albe www-data 4096 Aug 21 16:18 .
drwxrwsrwx  2 albe www-data 4096 Aug 21 16:18 t1


albe@pmdsdata7:/srv/file/test/472dkrcollection/debian$ rm -r t1

albe@pmdsdata7:/srv/file/test/472dkrcollection/debian$ ll
total 32
drwxrwsrwx  2 albe www-data 4096 Aug 21 16:18 .
drwxrwsr-x 27 albe www-data 4096 Aug 21 15:42 ..
-rwxrwxrwx  1 albe www-data   55 Aug 21 15:43 README.md
-rwxrwxrwx  1 albe www-data    3 Aug 21 15:42 _status..txt
albe@pmdsdata7:/srv/file/test/472dkrcollection/debian$


```
