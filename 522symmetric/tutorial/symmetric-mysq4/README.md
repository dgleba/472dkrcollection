
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  mysql corp and store1
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-07-01[Jul-Wed]20-12PM 

# Instructions.

```
# NOTE -- dc = docker-compose

dir='/srv/dkr/472dkrcollection/522symmetric/symmetricdgmysql2'

chmod +x conf/*.sh
dc build


# start db's
#
dc up corp store1 adminer


# initialize symmetric stuff
#
dc run --rm sym bash -c "bash /app/conf/init.sh"


dc up sym


# symmetric log.
#
cd $dir
dc exec sym bash -c 'tail -f syms/logs/symmetric.log'


# initial load store node with data from corp
#
cd $dir
dc exec sym bash -c 'syms/bin/symadmin --engine corp-000 reload-node 001'



```








#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-07-01[Jul-Wed]22-51PM 



older stuff below..





#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  tutorial. works.
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-30[Jun-Tue]22-39PM 

C:\n\sfile\0computersf\0-cm-notes-01\symmetric\2020-06-29.symmetric.txt

C:\n\sfile\0computersf\0-cm-notes-01\symmetric\tutorials.html
https://www.symmetricds.org/doc/3.11/html/tutorials.html#_quick_start


chmod +x conf/*.sh
dc build

dc up store1 adminer

# init

dc run --rm sym bash -c "/app/conf/init.sh"

dc up sym


# h2 sql command line

z dg mys
dc exec sym bash
syms/bin/dbsql --engine corp-000


# h2 sql command line

z dg mys
dc exec sym bash
syms/bin/dbsql --engine store-002

# initial load..

syms/bin/symadmin --engine corp-000 reload-node 002

# initial load..

z dg mys
dc exec sym bash -c 'syms/bin/symadmin --engine corp-000 reload-node 001'


# logs/symmetric

z dg mys
dc exec sym bash -c 'tail -f syms/logs/symmetric.log'



ref.

originally forked..
	https://github.com/dgleba/docker-symmetricds


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  learning..
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-30[Jun-Tue]19-33PM 


https://www.symmetricds.org/doc/3.11/html/tutorials.html#_quick_start


dc exec sym bash
[root@135d0b42372e app]#


./symmetric-server-3.12.1/samples/corp-000.properties
./symmetric-server-3.12.1/samples/insert_sample.sql
./symmetric-server-3.12.1/samples/store-002.properties
./symmetric-server-3.12.1/samples/mask-account-number.bsh
./symmetric-server-3.12.1/samples/create_sample.xml
./symmetric-server-3.12.1/samples/store-001.properties
./symmetric-server-3.12.1/samples/node-id-generator.bsh

cd /app
cp ./symmetric-server-3.12.1/samples/*.properties  ./symmetric-server-3.12.1/engines


cd symmetric-server/samples/
[root@135d0b42372e samples]#

../bin/dbimport --engine corp-000 --format XML --alter-case create_sample.xml




   11  cd /app
   13  cp ./symmetric-server-3.12.1/samples/*.properties  ./symmetric-server-3.12.1/engines
   15  cd symmetric-server/samples/
   16  ../bin/dbimport --engine corp-000 --format XML --alter-case create_sample.xml
   17  ../bin/symadmin --engine corp-000 create-sym-tables
   18  ../bin/dbimport --engine corp-000 insert_sample.sql
   19  cd ..
symmetric-server/bin/sym

 
tail -f symmetric-server/logs/symmetric.log


src=symmetricdga_sym_1:/app/symmetric-server/samples
out=./x/1
mkdir -p $out
docker cp $src $out


https://pythonspeed.com/articles/schema-migrations-server-startup/



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-29[Jun-Mon]22-19PM 


https://www.symmetricds.org/doc/3.11/html/tutorials.html#_quick_start


cd
mkdir -p wa ; cd wa
wget https://www.jumpmind.com/downloads/symmetricds/releases/3.12/symmetric-pro-3.12.1.1-setup.jar


wget https://sourceforge.net/projects/symmetricds/files/symmetricds/symmetricds-3.12/symmetric-server-3.12.1.zip/download


cd
mkdir sym1; cd sym1
SYMMETRICDS_VERSION=3.12.1
MINOR=`echo "${SYMMETRICDS_VERSION}" | sed 's/\.[^.]*$//'` \
 && curl -L -o 'symmetricds.zip' "https://downloads.sourceforge.net/project/symmetricds/symmetricds/symmetricds-${MINOR}/symmetric-server-${SYMMETRICDS_VERSION}.zip" \
 && unzip 'symmetricds.zip' \
 && rm 'symmetricds.zip' \
 && ln -s "symmetric-server-${SYMMETRICDS_VERSION}/" 'syms'

=================================================




#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  update driver mysql
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-07-01[Jul-Wed]18-03PM 


albe@vamp398:/srv/test/522sym/symmetricdgmysql$ dc exec sym bash
[root@ba5f02a86f36 app]# mc

[root@ba5f02a86f36 lib]# pwd
/app/syms/lib

[root@ba5f02a86f36 lib]# ll
total 22008
-rw-r--r-- 1 root root   56556 Apr  7 14:20 alpn-boot-8.1.13.v20181017.jar
-rw-r--r-- 1 root root   61829 May 19  2015 commons-logging-1.2.jar
-rw-r--r-- 1 root root 4402005 May 15 10:00 conscrypt-openjdk-uber-2.4.0.jar
-rw-r--r-- 1 root root 1659879 Dec  8  2014 h2-1.3.176.jar
-rw-r--r-- 1 root root   23590 May 15 10:00 log4j-slf4j-impl-2.13.3.jar
-rw-r--r-- 1 root root  999808 Mar 11  2018 mysql-connector-java-5.1.45.jar



