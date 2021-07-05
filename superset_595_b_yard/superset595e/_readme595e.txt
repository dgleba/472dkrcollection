
follow:
https://superset.apache.org/docs/installation/installing-superset-using-docker-compose#installing-superset-locally-using-docker-compose


# Skip this.. git clone https://github.com/apache/superset.git superset595e

cd superset595e

see makefile for up and down after first start.

see ./_firsttimestartprod.sh below.


_____________



_____________

#sed -i '/<pattern>/s/^/# /' file
# test.. sed  '/container_name/s/^/# /' docker-compose-non-dev.yml > docker-compose-prod.yml
# test.. sed  '/container_name/s/^/# /' docker-compose.yml > docker-compose2.yml
# sed -i '/container_name/s/^/# /' docker-compose-non-dev
_____________

_____________

# Stop and nuke.

make down
dclean
dvn superset595e

_____________


=================================================

staged start seems better. fewer errors in log.


# logs..

z 595e
docker-compose -f docker-compose-prod.yml logs -tf


=================================================

# Start!!! 
# paste the following code and it will create and run a script..

cd /srv/dkr/472dkrcollection/superset_595_b_yard/superset595e
#
filen=./_firsttimestartprod.sh
#
tee $filen <<- 'EOF'
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
EOF

chmod +x $filen;
touch .env
chmod +x docker/*.sh
# start it up..
  $filen;
ls




=================================================

# for manual testing..


# logs..

z 595e
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




=================================================
