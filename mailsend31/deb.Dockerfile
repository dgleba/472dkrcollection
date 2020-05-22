FROM ubuntu:16.04
# noneed RUN mkdir /app

RUN apt-get update 

RUN  apt-get -y install  ssmtp mc

WORKDIR /app

# COPY ./entry.sh /app 
# Run  chmod 777 /app && chmod 777 /app/entry.sh

COPY ssmtp.conf /etc/ssmtp 
COPY mailname /etc/mailname 

# ENTRYPOINT ["/bin/bash /app/entry.sh"]

# notes ...



