
# Purpose

This file has the latest instructions.


# Docker System - 

mysql backend database with php adminer django rails




## start it up 


See makefile for details 

Also use these alias from  https://github.com/dgleba/vamp206a/blob/master/a3/32init.sh#L225
	
  examples..
  
	```
	echo "alias dkup='docker-compose up'" >>   ~/.bash_aliases
	echo "alias dkd='docker-compose down'" >>   ~/.bash_aliases
	echo "alias dkupd='docker-compose up -d'" >>   ~/.bash_aliases
	echo "alias dkupr='docker-compose  up --build  --force-recreate  '" >>   ~/.bash_aliases
	echo "alias dkupp='docker-compose up -f docker-compose.prod.yml -d'" >>   ~/.bash_aliases
	echo "alias dkps='set -vx; docker images; docker network ls;	docker volume ls;	docker ps -a;	docker ps; set +vx'" >>   ~/.bash_aliases
  ```


 
## connect to mysql

Substitute `pmdsdata4` with whatever host address your are running from.

Open `pmdsdata4:6092/a.php` to open adminer. Login with..

  - server - dbm
  - username - root
  - password - root
  
  

## more

docker  inspect mysql_dbm_1

  