FROM ubuntu:16.04
MAINTAINER Neha Bhardwaj David Gleba

# Install cron
RUN apt-get update && apt-get install -y cron tzdata 

RUN ln -sf /usr/share/zoneinfo/US/Central /etc/localtime
RUN echo "US/Eastern" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata


# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
