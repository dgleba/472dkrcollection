# 2020-07-14


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

```
mb_1       | 07-14 14:39:11 ERROR generic-sql.query-processor :: Failed to set timezone:
mb_1       |  SQLException:
mb_1       |  Message: Unknown or incorrect time zone: 'US/Eastern'
mb_1       |  SQLState: HY000
mb_1       |  Error Code: 1298

mb_1       | 07-14 14:50:30 ERROR generic-sql.query-processor :: Failed to set timezone:
mb_1       |  SQLException:
mb_1       |  Message: Connections could not be acquired from the underlying database!
mb_1       |  SQLState: null
mb_1       |  Error Code: 0
mb_1       |
mb_1       | SQLException:
mb_1       |  Message: An SQLException was provoked by the following failure: com.mchange.v2.resourcepool.ResourcePoolException: A ResourcePool cannot acquire a new resource -- the factory or source appears to be down.
mb_1       |  SQLState: null
mb_1       |  Error Code: 0
mb_1

```

## Upgrade again

set metabase to v30.4 in docker compose yml file

```
dc up mb
```











#
#
#



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# @  older...

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


