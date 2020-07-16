# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl




  
sysh:
	docker-compose  run --rm sym bash


fixinit:
	# docker-compose  run  sym bash -c 'mkdir -p "/app2/_0-init-has-run-marker-directory"'
	docker-compose  exec  sym bash -c 'mkdir -p "/app2/_0-init-has-run-marker-directory"'








 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

#  other and `less common` stuff, examples etc...



  
mysh_01:
	docker-compose  -f docker-compose.yml exec dbm /bin/bash

mydump_01:
	docker-compose  exec dbm /bin/bash /root/all-individual-mysqldump.sh


# got error changing database user in metabase.. java.sql.SQLException: null, message from server: "Host 'pmdsdata8.stackpole.ca' is blocked because of many connection errors; unblock with 'mysqladmin flush-hosts'"
myflu_01:
	docker-compose  -f docker-compose.yml exec dbm sh -c 'mysqladmin -u$$MYSQL_ROOT_USER -p$$MYSQL_ROOT_PASSWORD flush-hosts;'


mkd_01:
	 docker-compose exec db /bin/bash /root/mkdata.sh


ash_01:
	docker-compose  -f docker-compose.yml exec adminer sh

	

mycrd_01:
	docker-compose exec dbm /bin/bash /root/dbcr.sh

myimpa_01:
	docker-compose  -f mysql/docker-compose.yml exec dbm /bin/bash /root/sh21.sh

	

mydumpb_01:
	docker-compose  -f mysql/docker-compose.yml exec dbm sh -c 'exec mysqldump  --force --opt --user=root -p"$$MYSQL_ROOT_PASSWORD" --databases dkrdbm dgnote130  \
    --complete-insert --quote-names  --allow-keywords  \
    --skip-add-drop-table --add-drop-database  --skip-lock-tables  --no-tablespaces --no-create-info --routines  \
    --events  > /home/db_mysqldump.sql '


mycrd9_01:
	docker-compose exec dbm sh -c 'exec mysql  -uroot -p"$$MYSQL_ROOT_PASSWORD"  -e "create database \
			if not exists metabasedb"'

			
myrup_01:
# db recreate build force
	docker-compose  up --build  --force-recreate  
 
myup_01:
# db up
	docker-compose up 

phprup_01:
	# docker-compose  -f php/docker-compose.yml stop \
	docker-compose  -f ../php392/docker-compose.yml up --build  --force-recreate  
   
phpup_01:
	docker-compose  -f ../php392/docker-compose.yml up 
   
   
myl_01:
	docker-compose  -f mysql/docker-compose.yml logs -t -f

adup_01:
	docker-compose  -f ../adminer392/docker-compose.yml up --build  --force-recreate  

myd_01:
# dump
	docker-compose  -f mysql/docker-compose.yml run

 

# run system with umask test dockerfile
# I can't seem to get writable group permissions 2018-08-27_Mon_21.28-PM
#
umasktest_01:
	docker-compose  -f docker-compose.devtest.yml  run djangodev  django-admin.py startproject myproject .

  
# shell in django
#
djbash_01:
	docker-compose run djangodev /bin/bash

dps_01:
	docker images
	docker network ls
	docker volume ls 
	docker ps -a
	docker ps 

  
# clean docker containers 
#
clean_01:
	# remove this one.. 
	-docker rmi dkr382django2t_djangodev 
	-docker rmi dkr382r-django_djangodev
  # remove docker containers exited 
	-docker rm $$(docker ps -qa --no-trunc --filter "status=exited") 
	# remove tagged <none> 
	-docker rmi $$(docker images | grep "^<none>" | awk '{ print $3 }') 
  #volumes
	-docker volume rm $(docker volume ls -qf dangling=true)
	docker images
	docker network ls
	docker volume ls 
	docker ps -a
	docker ps 


#
dkv_01:
	docker --version
	docker-compose -version

  
perm_01:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..  
	docker-compose run djangodev sh sc/fixpermsh

    
# having trouble setting env variable, but do I need it?  
#
perm2_01:
	docker-compose run djangodev \
	bash -c "export fold=/myproject; chmod -R g+rws,o-w  $${fold}"

  
recreatep_01:
# recreate for production...
	docker-compose -f docker-compose.prod.yml up --build  --force-recreate  

rup_01:
# dev recreate build force
	docker-compose  up --build  --force-recreate  
 
up_01:
# dev recreate build force
	docker-compose  up 

 
  
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/docker/compose/issues/2033 docker compose command line run sh multiple commands in one line
# $ requires escaping with $, so, $$
# continuation card  \
# - dash in front of command ignores error. -rm -f *.o
