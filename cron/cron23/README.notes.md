
https://stackoverflow.com/questions/55096382/how-to-run-cron-job-in-docker-container


Crontab requires additional field: user, who runs the command:

* * * * * root python3 /code/populatePDBbackground.py > /var/log/cron.log
# Empty line >> /var/log/cron.log


The Dockerfile is:

FROM python:3
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y cron postgresql-client
RUN touch /var/log/cron.log
RUN mkdir /code
WORKDIR /code
ADD . /code/
COPY crontab /etc/cron.d/cjob
RUN chmod 0644 /etc/cron.d/cjob
ENV PYTHONUNBUFFERED 1
CMD cron -f



Test python script populatePDBbackground.py is:

from datetime import datetime

print('Script has been started at {}'.format(datetime.now()))
And finally we get:



$ docker run -d b3fa191e8822
b8e768b4159637673f3dc4d1d91557b374670f4a46c921e0b02ea7028f40e105

$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
b8e768b41596        b3fa191e8822        "/bin/sh -c 'cron -f'"   4 seconds ago       Up 3 seconds                            cocky_beaver



$ docker exec -ti b8e768b41596 bash
root@b8e768b41596:/code# tail -f /var/log/cron.log
Script has been started at 2019-03-13 00:06:01.095013
Script has been started at 2019-03-13 00:07:01.253030
Script has been started at 2019-03-13 00:08:01.273926

