# ref.

https://docs.docker.com/compose/django/

# Installation

- If you have windows OS, install virtualbox and install ubuntu 16 inside it.
- Use ubuntu 16.

```
# cd to a tmp folder
cd tmp
git clone https://github.com/dgleba/472dkrcollection.git
cd 472dkrcollection
cp -a 499d-django/ myshinynewdjangoprojectname
```

- install docker and docker-compose
- Do not install python, or django

# Makefile

Look at the make file for useful commands to speed up using the system.

eg: make clean - this will clean up unneeded containers and such.



# commands - for Development

```
docker-compose build

docker-compose run --rm djdev django-admin.py startproject djangoproj .

# delete all docker images, containers, volumes, etc for this compose file
   dkd --rmi all -v


docker-compose run --rm djdev python manage.py startapp polls

docker-compose run --rm djdev python manage.py startapp trakberry2


# This can work with sqlite in development. See production below for use with mysql.
  docker-compose run --rm djdev python manage.py makemigrations
  docker-compose run --rm djdev python manage.py migrate
  docker-compose run --rm djdev python manage.py createsuperuser


dc up
dc stop
dc restart


visit -    http://10.4.1.228:6461/

admin -   http://10.4.1.228:6461/admin/login/?next=/admin/
  User - root . passw - 123


```

# Pemmissions:

- Docker may run with root or other user.
- To edit files you may have to adjust the permissions.
- use `make perm` to gain permissions to edit/write the files.

# all hosts

in settings.py

```
ALLOWED_HOSTS = os.getenv('ALLOWED_HOSTS').split(',') if os.getenv('ALLOWED_HOSTS') else []
```

# Production deployment

```
docker-compose -f docker-compose.prod.yml build

docker-compose -f docker-compose.prod.yml up


docker-compose -f docker-compose.prod.yml run --rm  djprod python manage.py makemigrations

docker-compose -f docker-compose.prod.yml run --rm  djprod python manage.py showmigrations

docker-compose -f docker-compose.prod.yml run --rm  djprod python manage.py migrate

docker-compose -f docker-compose.prod.yml run --rm  djprod python manage.py syncdb


docker-compose -f docker-compose.prod.yml run --rm  djprod python manage.py createsuperuser


no..
  no.. docker-compose run --rm djprod python manage.py collectstatic

yes..
  docker-compose -f docker-compose.prod.yml run --rm  djprod python manage.py collectstatic --noinput


docker-compose -f docker-compose.prod.yml up
docker-compose -f docker-compose.prod.yml stop
docker-compose -f docker-compose.prod.yml restart


Note:
  exec can be used to execute within a running container. 
    Above, `run` is used which creates a new container and runs it.
  example.. docker-compose -f docker-compose.prod.yml exec djprod python manage.py makemigrations


```

# Database commands

examples of commands to import, export, etc are here..

https://github.com/dgleba/482dkrcollection/blob/master/mysqlsimple5/Makefile#L32



# 

# REFERENCE


# Django tutorial app code


## 2.0 - 3.0

ggl: django tutorial 3.0 download polls example


1.

https://github.com/krzysieqq/Django-poll-app

Django 1.10 poll app tutorial


2.

https://github.com/divio/django-polls

no mysite.

3.

git clone https://github.com/deployment-from-scratch/django-2.2-polls

seems good.




## 1.8

Search: django tutorial 1.8 download polls


1.

https://github.com/SanketDG/django-polls

Following the Django 1.8 Tutorial https://docs.djangoproject.com/en/1.8/intro/tutorial01/


2.

https://github.com/hezhao/django-polls

Django 1.8 tutorial app with Python 3.5 https://docs.djangoproject.com/en/1.8…

Following the Django 1.8 Tutorial https://docs.djangoproject.com/en/1.8/intro/tutorial01/





# 

# older

# older

# older

# Dockerized Django

Sample project on how to dockerize your Django project in development and production environments.

This may have come from..

[remote "origin"]
url = https://github.com/nicholaskajoh/dockerized-django.git

## Requirements

- Docker
- Docker Compose

## Development

- Clone project
- Create _.env_ and _.env.secret_ from the example files in the root folder and edit as appropriate
- Run `docker-compose up`
- Visit localhost:8000

## Production

- Follow the first 2 steps outlined above
- Run `docker-compose -f docker-compose.prod.yml up --build -d`
- Run `docker-compose -f docker-compose.prod.yml run web python manage.py migrate`
- Run `docker-compose -f docker-compose.prod.yml run web python manage.py collectstatic --noinput`
- Visit website
