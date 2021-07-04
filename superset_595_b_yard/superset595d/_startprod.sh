docker-compose -f docker-compose-prod.yml up -d redis db 
s=129 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset 
s=15 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset-init 
s=259 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset-worker superset-worker-beat
