docker-compose -f docker-compose-prod.yml up -d redis db adminer
date
s=129 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

# try this order..
docker-compose -f docker-compose-prod.yml up -d superset-init 
# I think about 5 minutes should be enough. I think the next parts can be started before this fully finishes.
# 600 seconds should over do it.
date
s=600 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset 
date
s=15 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset-worker superset-worker-beat
date
