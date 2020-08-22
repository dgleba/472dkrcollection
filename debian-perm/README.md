
# Purpose:

test changing permissions using container


# Idea:

- start it up, 
- run bash permsh. 
- see that permissions are changed on /app and that it can be removed or edited using the host linux user.


## Commands:

```
docker-compose up -d

$ ll
drwxr-sr-x  2 root www-data 4096 Aug 21 16:18 app

$ find |grep app
./app
./app/t1
./app/t1/f1

$ echo two>> app/t1/f1
-bash: app/t1/f1: Permission denied

$ cat  app/t1/f1

$ bash permsh
uid=1000(albe) gid=1000(albe) groups=1000(albe),4(adm),20(dialout),24(cdrom),27(sudo),30(dip),33(www-data),46(plugdev),110(lxd),115(lpadmin),116(sambashare),119(docker),999(mysql),1003(ftpup),1005(recovery),1007(edgecom)
uid=1000

$ ll
drwxrwsrwx  2 albe www-data 4096 Aug 21 16:18 app

$ echo two>> app/t1/f1

$ cat  app/t1/f1
two

$ rm -r app/t1

$ find |grep app
./app


```
