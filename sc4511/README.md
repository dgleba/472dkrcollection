
# Instructions

```

Prep:

docker-compose build

docker-compose run --rm sc4 npm i

docker-compose run --rm sc4 npm i --save nodemailer


run:

docker-compose run --rm sc4 node --unhandled-rejections=strict index.js 

docker-compose run --rm sc4 node test-pupshot.js

docker-compose run --rm sc4 node test-email.js


```



# errors

```

docker puppeteer apt-key output should not be parsed (stdout is not a terminal)

docker puppeteer gpg: no valid OpenPGP data found.


```


# mail

```

No luck with this..

https://hub.docker.com/r/eeacms/postfix/


docker run --rm --name=postfix \
             -e  MTP_HOST=192.168.88.45 \
         eeacms/postfix
         
docker run --rm --name=postfix \
             -e  MTP_HOST=ubu398j.local \
         eeacms/postfix
         
         
docker run -it --rm --link=postfix busybox sh
   telnet postfix 25
  HELO ubu398j.local
  MAIL FROM: dgleba@ubu398j.local
  RCPT TO: dgleba@gmail.com
  DATA
  subject: Test
  Testing 1, 2, 3
  .
  quit         
  
  
```


#
