FROM ubuntu:18.04
MAINTAINER David Gleba

# Install cron
# RUN apt-get update && apt-get install -y cron 

RUN echo "postfix	postfix/mailname string debianmail21.local" | debconf-set-selections \
  && echo "postfix postfix/main_mailer_type string 'Satellite system'" | debconf-set-selections \
  &&  apt-get update && apt-get -y install  postfix mailutils mc nano cron iputils-ping

# install rsyslog if needed for debugging cron
# RUN  apt-get install -y  rsyslog

RUN sed -i '/relayhost*/c\relayhost = [192.168.88.60]:25' /etc/postfix/main.cf

