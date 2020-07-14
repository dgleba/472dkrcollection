# 2020-07-14

# Upgrade from v0.25.2

## Transfer data from pd3

```
albe@pmdsdata3:/srv/dkr/mysql519$ make dump
docker-compose  exec dbm /bin/bash /root/all-individual-mysqldump.sh
```
## Start db and import

```
dc up dbm
make impa 
```

```
albe@pmdsdata8:/srv/dkr/metabase6515$ make impa
# import metabasedb from pmdsdata3
docker-compose   exec  dbm sh -c 'exec mysql  --user=root   \
    -p"$MYSQL_ROOT_PASSWORD" < /data/dbm/metabasedb_mysqldump_typ1.sql '
albe@pmdsdata8:/srv/dkr/metabase6515$ ll
```


## Upgrade 

set metabase to v26.3 in docker compose yml file

```
dc up mb
```


## Upgrade again

set metabase to v30.4 in docker compose yml file

```
dc up mb
```

## Upgrade to 35.4

do the last upgrade.


## Fix errors.

fix errors with db hosts being localhost. should be 10.4.1.231.

fix TZ errors.

Fixup general settings.

address all errors in logs.


# Done.

done.









#
#
#



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# @  older - do not use...

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-07-14[Jul-Tue]09-40AM 



# Metabase Docker-compose


This:  https://github.com/dgleba/metabase


## Usage:  

```
cd /mydockerfolder
git clone  https://github.com/dgleba/metabase 
cd metabase
docker-compose up
```

## make database in mysql

```
cd /srv/dkr/392dkr/backend392
make mycrd
```


## Bash aliases

Also use these alias from https://github.com/dgleba/vamp206a/blob/master/a3/32init.sh#L225

- examples..

	```
	echo "alias dkup='docker-compose up'" >>   ~/.bash_aliases
	echo "alias dkd='docker-compose down'" >>   ~/.bash_aliases
	echo "alias dkupd='docker-compose up -d'" >>   ~/.bash_aliases
	echo "alias dkupr='docker-compose  up --build  --force-recreate  '" >>   ~/.bash_aliases
	echo "alias dkupp='docker-compose up -f docker-compose.prod.yml -d'" >>   ~/.bash_aliases
	echo "alias dkps='set -vx; docker images; docker network ls;	docker volume ls;	docker ps -a;	docker ps; set +vx'" >>   ~/.bash_aliases
    ```
	
	

## Access

Access your instance in a browser at `localhost:6052`.
Edit `localhost` to whatever IP or named address your machine is.


