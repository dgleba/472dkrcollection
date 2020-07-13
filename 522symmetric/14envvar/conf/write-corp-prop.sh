
# write engine properties file

cat << EOL > "./syms/engines/${CORP_ENGINE_NAME}.properties"
rest.api.enable=true
engine.name=${CORP_ENGINE_NAME}
group.id=${CORP_GROUP_ID}
external.id=${CORP_EXTERNAL_ID}
sync.url=${SYNC_URL}/${CORP_ENGINE_NAME}
registration.url=${CORP_REGISTRATION_URL}
db.driver=${CORP_JDBC_DRIVER}
db.url=jdbc:mysql://${CORP_DB_HOST}:${CORP_DB_PORT}/${CORP_DB_NAME}?${CORP_DB_OPTIONS}
db.user=${CORP_DB_USER}
db.password=${CORP_DB_PASSWORD}
#
# options
#
job.purge.period.time.ms=7200000
# I should add time to these settings in production. Say about 100,000 which is 100 seconds. Maybe add a zero to each ...
# How to run routing (in millis), which puts changes into batches.
job.routing.period.time.ms=5000
# How often to run push (in millis), which sends changes to other nodes.
job.push.period.time.ms=10000
# How often to run pull (in millis), which receives changes from other nodes.
job.pull.period.time.ms=10000
# Automatically register new nodes when they request it.
# If this is false, accept the registration requests using "symadmin open-registration" command.
auto.registration=true
# When this node sends an initial load of data to another node, first send table create scripts.
initial.load.create.first=true
job.heartbeat.period.time.ms=18000
EOL

