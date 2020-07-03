
 
#  Symmetricds replication one way - Mysql, corp and store1

# Instructions.

```
# may be optional.
chmod +x conf/*.sh

docker-compose build

docker-compose up 


# Initial load store node with data from corp
#
# You may have to wait up a few minutes for all to be ready..
#
docker-compose exec sym bash -c 'syms/bin/symadmin --engine corp-000 reload-node 001'


Done. Now edits in corp show up in store1.

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


