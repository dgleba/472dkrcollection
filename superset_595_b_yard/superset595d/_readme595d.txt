
follow:
https://superset.apache.org/docs/installation/installing-superset-using-docker-compose#installing-superset-locally-using-docker-compose


git clone https://github.com/apache/superset.git superset595d

 cd superset595d

This seems to have startup order problems. see my script below to start up.

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


2021-07-04 worked, but try different order...
# Start!!! #1

cd /srv/dkr/472dkrcollection/superset_595_b_yard/superset595d
#
filen=./_startprod.sh
#
tee $filen <<- 'EOF'
docker-compose -f docker-compose-prod.yml up -d redis db 
s=129 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset 
s=15 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset-init 
s=259 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset-worker superset-worker-beat
EOF
chmod +x $filen;
# start it up..
  $filen;

=================================================

# Start!!! #2

cd /srv/dkr/472dkrcollection/superset_595_b_yard/superset595d
#
filen=./_startprod.sh
#
tee $filen <<- 'EOF'
docker-compose -f docker-compose-prod.yml up -d redis db 
s=129 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

# try this order..
docker-compose -f docker-compose-prod.yml up -d superset-init 
# I think about 5 minutes should be enough. I think the next parts can be started before this fully finishes.
# 600 seconds should over do it.
s=600 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset 
s=15 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;

docker-compose -f docker-compose-prod.yml up -d superset-worker superset-worker-beat
EOF
chmod +x $filen;
# start it up..
  $filen;


=================================================

# for manual testing..


# logs..

z 595d
docker-compose -f docker-compose-prod.yml logs -tf

# in another terminal

docker-compose -f docker-compose-prod.yml up -d redis db adminer
sleep 80

docker-compose -f docker-compose-prod.yml up -d superset-init 
# it took almost 11 minutes for this to complete on my system..
sleep 660


docker-compose -f docker-compose-prod.yml up -d superset 
sleep 4

docker-compose -f docker-compose-prod.yml up -d superset-worker superset-worker-beat


_____________

# Stop and nuke.

make down
dclean
dvn superset595d


=================================================
