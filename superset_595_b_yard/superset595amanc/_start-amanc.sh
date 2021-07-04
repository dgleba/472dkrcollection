docker-compose -f docker-compose.yml up -d redis mysql adminer 
s=129 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose   run --rm  superset bash superset-init
s=19 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose.yml up -d superset 
s=39 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;
echo 
echo 
echo You can try to log in now.
echo
echo
