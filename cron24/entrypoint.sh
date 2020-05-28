#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

# Get env

# method 1

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

# method 2

# turn on bash's job control
set -m
# extract environment variables for cron
printenv | sed 's/^\(.*\)$/export \1/g' > /root/project_env.sh
# Start the helper processes
service rsyslog start
# service cron start


# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/container.env
* * * * * /run.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler-orig.txt

# Setup a cron schedule
# /proc/1/fd/1 goes to docker log 
echo "SHELL=/bin/bash
BASH_ENV=/root/project_env.sh
* * * * * /run.sh >> /proc/1/fd/1  2>&1
# This extra line makes it a valid cron" > scheduler.txt


crontab scheduler.txt
cron -f

