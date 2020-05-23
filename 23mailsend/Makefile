
# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl

	
m8:
	docker-compose exec  deb /bin/bash -c ' 	echo "Test mail debian-mail08 dkr" | mail  -r davidgleba@hotmail.com -s "Test mail 478"  dgleba@gmail.com '

m7:
	docker-compose exec  deb /bin/bash -c ' 	echo -e  "Test mail  dkr \n 23mailsend \n = \n " | mail  -r david1212@gmail.com -s "Test mail 4914"  dgleba@gmail.com '

m6:
	docker-compose exec  deb /bin/bash -c ' 	echo "Test mail debian-mail08 dkr" | mail  -r dgleba@stackpole.com -s "Test mail 478"  dgleba@stackpole.com '


sh:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	# docker-compose  -f docker-compose.yml run --rm ubu /bin/bash
	docker-compose   run  deb /bin/bash
	












 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 


#  other / examples stuff...




# this wont work, but it works to send mail within make sh...  
m7a:
	docker-compose exec   deb /bin/bash -c ' sleep 1 && echo "Subject: test 614" | /usr/sbin/sendmail dgleba@stackpole.com '
	
m9:
	docker-compose exec   deb /bin/bash -c ' sleep 1 && echo "Subject: test 616" | /usr/sbin/sendmail dgleba@gmail.com '
	
m5:
	docker-compose run   deb /bin/bash -c ' sleep 3 && echo "Subject: test 612" | /usr/sbin/sendmail dgleba@stackpole.com '

m4:
	docker-compose run --rm  deb /bin/bash -c ' 	echo "Test mail debian-mail08 dkr" | mail  -r dgleba@stackpole.com -s "Test mail 470"  dgleba@stackpole.com  '

m3:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run --rm  deb /bin/bash -c ' 	echo "Test mail debian-smpl dkr" | mail  -r dgleba@stackpole.com -s "Test mail 450"  dgleba@stackpole.com  '

m2:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run --rm  deb /bin/bash -c ' ls -la && pwd \
		&& debconf-show postfix && echo "Test mail debian-smpl dkr" | mail  -r dgleba@stackpole.com -s "Test mail 449"  dgleba@stackpole.com  '

sm:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run --rm  deb /bin/bash -c ' ls -la && pwd \
		&& debconf-show postfix && echo "Subject: test 447 debian-smpl dkr" | /usr/sbin/sendmail dgleba@stackpole.com  '

dco:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run  deb /bin/bash -c ' ls && pwd \
		&& debconf-show postfix  '


upsf:
	docker-compose  -f docker-compose-sf.yml up --build  --force-recreate 

shprox:
	docker-compose  -f docker-compose.yml exec proxy /bin/bash

 mydump:
	docker-compose  -f mysql/docker-compose.yml exec dbm /bin/bash /root/all-individual-mysqldump.sh
 
mycrd:
	docker-compose exec dbm /bin/bash /root/dbcr.sh

myimpa:
	docker-compose  -f mysql/docker-compose.yml exec dbm /bin/bash /root/sh21.sh

	
mydumpb:
	docker-compose  -f mysql/docker-compose.yml exec dbm sh -c 'exec mysqldump  --force --opt --user=root -p"$$MYSQL_ROOT_PASSWORD" --databases dkrdbm dgnote130  \
    --complete-insert --quote-names  --allow-keywords  \
    --skip-add-drop-table --add-drop-database  --skip-lock-tables  --no-tablespaces --no-create-info --routines  \
    --events  > /home/db_mysqldump.sql '


mycrd9:
	docker-compose exec dbm sh -c 'exec mysql  -uroot -p"$$MYSQL_ROOT_PASSWORD"  -e "create database \
			if not exists metabasedb"'

			
myrup:  
# db recreate build force
	docker-compose  up --build  --force-recreate  
 
myup:  
# db up
	docker-compose up 

phprup:  
	# docker-compose  -f php/docker-compose.yml stop \
	docker-compose  -f ../php392/docker-compose.yml up --build  --force-recreate  
   
phpup:  
	docker-compose  -f ../php392/docker-compose.yml up 
   
   
myl:
	docker-compose  -f mysql/docker-compose.yml logs -t -f

adup:  
	docker-compose  -f ../adminer392/docker-compose.yml up --build  --force-recreate  

myd:  
# dump
	docker-compose  -f mysql/docker-compose.yml run

 

# run system with umask test dockerfile
# I can't seem to get writable group permissions 2018-08-27_Mon_21.28-PM
#
umasktest:
	docker-compose  -f docker-compose.devtest.yml  run djangodev  django-admin.py startproject myproject .

  
# shell in django
#
djbash:
	docker-compose run djangodev /bin/bash

dps:   
	docker images
	docker network ls
	docker volume ls 
	docker ps -a
	docker ps 

  
# clean docker containers 
#
clean:   
	# remove this one.. 
	-docker rmi dkr382django2t_djangodev 
	-docker rmi dkr382r-django_djangodev
  # remove docker containers exited 
	-docker rm $$(docker ps -qa --no-trunc --filter "status=exited") 
	# remove tagged <none> 
	-docker rmi $$(docker images | grep "^<none>" | awk '{ print $3 }') 
  #volumes
	#careful.. -docker volume rm $$(docker volume ls -qf dangling=true)
	docker images
	docker network ls
	docker volume ls 
	docker ps -a
	docker ps 


#
dkv: 
	docker --version
	docker-compose -version

  
perm:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..  
	docker-compose run djangodev sh sc/fixpermsh

    
# having trouble setting env variable, but do I need it?  
#
perm2:  
	docker-compose run djangodev \
	bash -c "export fold=/myproject; chmod -R g+rws,o-w  $${fold}"

  
recreatep:  
# recreate for production...
	docker-compose -f docker-compose.prod.yml up --build  --force-recreate  

rup:  
# dev recreate build force
	docker-compose  up --build  --force-recreate  
 
up:  
# dev recreate build force
	docker-compose  up 

 
  
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/docker/compose/issues/2033 docker compose command line run sh multiple commands in one line
# $ requires escaping with $, so, $$
# continuation card  \
# - dash in front of command ignores error. -rm -f *.o
