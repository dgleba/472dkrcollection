
follow:
https://superset.apache.org/docs/installation/installing-superset-using-docker-compose#installing-superset-locally-using-docker-compose


git clone https://github.com/apache/superset.git superset595d

 cd superset595d

 docker-compose -f docker-compose-non-dev.yml up

 docker-compose -f docker-compose-prod.yml up


_____________


In docker-compose-non-dev.yml  I changed to:  version: "3.6"

then i upgraded docker-compose


_____________


admin password admin not working.


    docker-compose  -f docker-compose-prod.yml  exec superset bash /app/docker/docker-init.sh





_____________

#sed -i '/<pattern>/s/^/# /' file
# test.. sed  '/container_name/s/^/# /' docker-compose-non-dev.yml > docker-compose-prod.yml
# test.. sed  '/container_name/s/^/# /' docker-compose.yml > docker-compose2.yml
# sed -i '/container_name/s/^/# /' docker-compose-non-dev
_____________


=================================================

staged start seems better. fewer errors in log.


# logs..

z 595d
docker-compose -f docker-compose-prod.yml logs -tf


# Start!!!

z 595d
cd /srv/dkr/472dkrcollection/superset_595_b_yard/superset595d
#
filen=./_startprod.sh
#
tee $filen <<- 'EOF'
# ---------------------------------------------------
z 595d
docker-compose -f docker-compose-prod.yml up -d redis db 
s=30 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;
z 595d
docker-compose -f docker-compose-prod.yml up -d superset 
s=15 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;
z 595d
docker-compose -f docker-compose-prod.yml up -d superset-init 
s=139 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;
z 595d
docker-compose -f docker-compose-prod.yml up superset-worker superset-worker-beat
EOF
chmod +x $filen;

# start it up..
  $filen;

