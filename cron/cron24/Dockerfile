FROM ubuntu:16.04
MAINTAINER Neha Bhardwaj David Gleba

# Install cron
RUN apt-get update && apt-get install -y cron 

# install rsyslog if needed for debugging cron
RUN  apt-get install -y  rsyslog

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
