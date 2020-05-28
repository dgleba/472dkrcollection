#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/container.env
* * * * * /run.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler-orig.txt

# turn on bash's job control
set -m


# Alternate method to get env variables.
#
# extract environment variables for cron
printenv | sed 's/^\(.*\)$/export \1/g' > /root/project_env.sh
#
#  /proc/1/fd/1 will send the output to the regular docker log.
#
# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/container.env
* * * * * root root . /root/project_env.sh;/run.sh >>  /proc/1/fd/1
# This extra line makes it a valid cron" > scheduler.txt
#
# crontab scheduler.txt

# Start the helper processes
service rsyslog start
service cron start

# Give execution rights on the cron job
# RUN mkdir crontab

# Apply cron job
echo "running - contab /code/crontab"
crontab /code/crontab

# echo "running - cron -f"
# cron -f

# CMD ["sh", "-c", "crontab /code/crontab ; cron -f"]
