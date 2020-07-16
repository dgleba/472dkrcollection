
 
#  Symmetricds replication two way - Mysql, corp and store1

It is two way sync. Corp is the original database and store1 is replicated from corp. Store1 is empty before the replication starts.

Corp and store are internal names. The actual db names are configured. It's like saying Master and slave, but much more politicially correct.

# Development Note

The instructions below are geared to allow fewer steps to launch the system during development.
The `sym` service waits for the two mysql database servers to become available and then launches a one time `init.sh`.

Maybe `init.sh` should be a seperate command since to run just the startup, the init.sh  is also run, which waits for the databases. Maybe instead of using entrypoint, if everything was in command, then it could be completely overridden from command line.

There are other ways to handle startup. Maybe the way below is not the best.





# Instructions to start it.

```

1.

# Optional, I don't think this is needed anymore. Doesn't hurt though.
    chmod +x conf/*.sh

2.

    docker-compose build


3.

    cp example.env.sym .env.sym

4.

edit .env.sym if needed.

edit these files to suit your needs..

    ./conf/corp-000.template.properties
    ./conf/store-001.template.properties

Condider..
    jdbc:mysql://192.168.88.60:13306/itemdb
is..
    jdbc:mysql://ip-of-mysql-server:port/database-to-sync

To use this example, you may have to edit the ip address in .env.sym to suit your docker host.


Tables in db to sync:

conf/insert_sym_settings.sql:78:values('alltbl',  '*,!ates*' ,  'main0',  current_timestamp, current_timestamp, 1 );

Above, '*,!ates*' says sync all tables in the configured itemdb except tables starting with `ates`.


It uses wildcards.
    See. 
    https://www.symmetricds.org/doc/3.12/html/user-guide.html#_trigger_wildcards


Edit any passwords, etc. in docker-compose.yml



5.

You may need to do this if it is configured in the volumes of the sym service in docker-compose.yml..

    rmdir datasys/app2/_0-init-has-run-marker-directory

Explanation:

Init.sh needs to run once to setup sym_ tables and initial settings. 

If permissions don't allow the rmdir above, then run this..

    docker-compose up -d adminer corp store1 
    # This may not be the best idea..  docker-compose run --rm sym bash -c 'rmdir /app2/_0-init-has-run-marker-directory'
    docker-compose run --rm sym bash -c 'chmod -R ugo+rwx /app2'
    rmdir datasys/app2/_0-init-has-run-marker-directory



6.

    docker-compose up 

7.

# Initial load store node with data from corp
#
# You may have to wait up a few minutes for all to be ready..
#

    docker-compose exec sym bash -c 'syms/bin/symadmin --engine corp-000 reload-node 001'


It should say.. `Successfully enabled initial load for node 001`
If not, then try again in a minute. I might not be ready yet.


8.

Done. Now edits in  corp show up or store1 are replicated to the other.


9.

Use adminer to view the mysql databases 

visit hostIp:14119 to use adminer in your browser.

use:
system: mysql
server: corp or store1
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

where `qissues` it the table modified.



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


