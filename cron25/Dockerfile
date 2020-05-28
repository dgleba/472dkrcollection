FROM ubuntu:16.04
MAINTAINER Neha Bhardwaj David Gleba

# Install cron
RUN apt-get update && apt-get install -y cron rsyslog tzdata 

# RUN ln -sf /usr/share/zoneinfo/US/Central /etc/localtime
# RUN echo "US/Eastern" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# Add files
RUN mkdir -p /code
COPY * /code/

RUN chmod +x /code/*.sh

# Copy or create your cron file named crontab into the root directory crontab
RUN chown -R root /code/crontab && chmod -R 0644 /code/crontab

ENTRYPOINT /code/entrypoint.sh
