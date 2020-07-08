
 
#  Symmetricds replication two way - Mysql, corp and store1


# Development Note

The instructions below are geared to allow fewer steps to launch the system.
The sym service waits for the two mysql databases to become available and then launches a one time init.sh.

Maybe init.sh should be a seperate command since to run just the startup, the init.sh is run is run, which waits for the databases.

There are other ways to handle startup. Maybe the way below is not the best.


# Instructions.

```

1.

# I don't think this is needed anymore.
    chmod +x conf/*.sh

2.

    docker-compose build


3.

Init.sh needs to run once to setup sym_ tables and initial settings. 

If  `datasys/app2/_0-init-has-run-marker-directory exists`  It cannot run. 

Run this if you do want to run init.sh...

    rmdir datasys/app2/_0-init-has-run-marker-directory

  if permissions don't allow the rmdir above, then run this..

    docker-compose up -d adminer corp store1 
    # This may not be the best idea..  docker-compose run --rm sym bash -c 'rmdir /app2/_0-init-has-run-marker-directory'
    docker-compose run --rm sym bash -c 'chmod -R ugo+rwx /app2'
    rmdir datasys/app2/_0-init-has-run-marker-directory


4.

    docker-compose up 

5.

# Initial load store node with data from corp
#
# You may have to wait up a few minutes for all to be ready..
#

    docker-compose exec sym bash -c 'syms/bin/symadmin --engine sv3-0-itemdb reload-node 1'


It should say.. `Successfully enabled initial load for node 001`
If not, then try again in a minute. I might not be ready yet.

6.

Done. Now edits in  corp show up or store1 are replicated to the other.


7.

Use adminer to view the mysql databases 

visit hostIp:14119 to use adminer in your browser.

use:
system: mysql
server: sv30 or sv31
username: root
password: user


```





# More.

```

1.

# symmetric sync log.
#
docker-compose exec sym bash -c 'tail -f syms/logs/symmetric.log'


2.

Change schema of a table.

    Change the schema of the table in corp using any way you chose to do it.

    docker-compose exec sym bash -c 'syms/bin/symadmin --engine corp-000 sync-triggers ; syms/bin/symadmin --engine corp-000 send-schema --node 001 qissues'



```





# Troubleshooting.

## 1. 

```
#### initial load store node with data from corp
docker-compose exec sym bash -c 'syms/bin/symadmin --engine corp-000 reload-node 001'

```

Sometimes it says..   `Unknown node 001`

Try again in a minute. It might not be ready.

It should say.. `Successfully enabled initial load for node 001`


