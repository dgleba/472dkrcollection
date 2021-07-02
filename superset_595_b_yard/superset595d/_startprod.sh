# ---------------------------------------------------
z 595d
docker-compose -f docker-compose-prod.yml up -d redis db 
s=11 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;
z 595d
docker-compose -f docker-compose-prod.yml up -d superset 
s=12 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;
z 595d
docker-compose -f docker-compose-prod.yml up -d superset-init 
s=139 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;
z 595d
docker-compose -f docker-compose-prod.yml up superset-worker superset-worker-beat
