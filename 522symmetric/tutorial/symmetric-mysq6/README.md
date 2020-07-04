
 
#  Symmetricds replication one way - Mysql, corp and store1

# Instructions.

```

1.
# may be optional.
chmod +x conf/*.sh

2.
docker-compose build


2b.
Init.sh needs to run once to setup sym_ tables and initial settings. 

If  `datasys/app2/_0-init-has-run-marker-directory exists`  It cannot run. 

Run this if you do want to run init.sh...

    docker-compose run --rm sym bash -c 'rmdir /app2/_0-init-has-run-marker-directory'


3.
docker-compose up 

4.

# Initial load store node with data from corp
#
# You may have to wait up a few minutes for all to be ready..
#
docker-compose exec sym bash -c 'syms/bin/symadmin --engine corp-000 reload-node 001'

It should say.. `Successfully enabled initial load for node 001`
If not, then try again in a minute. I might not be ready yet.

5.
Done. Now edits in item table in corp show up in store1.


6.
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
# symmetric sync log.
#
docker-compose exec sym bash -c 'tail -f syms/logs/symmetric.log'

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


