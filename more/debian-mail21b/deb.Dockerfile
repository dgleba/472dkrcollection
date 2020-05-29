FROM debian:10
# noneed RUN mkdir /app

RUN apt-get update 

RUN echo "postfix	postfix/mailname string debianmail21.local" | debconf-set-selections \
  && echo "postfix postfix/main_mailer_type string 'Satellite system'" | debconf-set-selections \
  &&  apt-get -y install  postfix mailutils mc nano

# I have left comments in here to record some of the things I tried.
  
# RUN   apt-get -y install sendmail-bin sendmail sendmail-cf m4     mailutils     mc 

# no luck with.. postfix

# put things that take a long time first. changing files in side with copy or workdir will invalidate cache.

# RUN sed -i '/relayhost*/c\relayhost = MESG01.stackpole.ca' /etc/postfix/main.cf

RUN sed -i '/relayhost*/c\relayhost = 10.5.1.210' /etc/postfix/main.cf


# RUN line=$(head -n 1 /etc/hosts) \
#   && line2=$(echo $line | awk '{print $2}') 

# Step 6/12 : Run sed -i '/nameserver.*/i nameserver 8.8.8.8'  /etc/resolv.conf
# sed: cannot rename /etc/sedNSM88D: Device or resource busy
# ERROR: Service 'deb' failed to build: The command '/bin/sh -c sed -i '/nameserver.*/i nameserver 8.8.8.8'  /etc/resolv.conf' returned a non-zero code: 4
# albe@pmdsdata7:/srv/file/test/482dkrcollection/debian-mail08$
# Run sed -i '/nameserver.*/i nameserver 8.8.8.8'  /etc/resolv.conf 

# RUN echo " pmdsdata7-dkr-01.local $line $line2.localdomain" >> /etc/hosts \
#   && echo "pmdsdata7-dkr-01.local" > /etc/hostname \
#   # && make -C /etc/mail 

# Run service postfix restart

WORKDIR /app

COPY entry.sh /app 
Run  chmod +x /app/entry.sh

ENTRYPOINT ["/app/entry.sh"]

# notes

#  && echo "postfix postfix/relayhost string MESG01.stackpole.ca" | debconf-set-selections \

# COPY requirements.txt /app/
# RUN pip install -r requirements.txt

