# ref.

https://docs.docker.com/compose/django/

# commands

```
docker-compose build

docker-compose run --rm djan django-admin.py startproject djangoproj .

# delete all docker images, containers, volumes, etc for this compose file
   dkd --rmi all -v

docker-compose run --rm djan python manage.py startapp polls


```

# all hosts

in settings.py

```
ALLOWED_HOSTS = os.getenv('ALLOWED_HOSTS').split(',') if os.getenv('ALLOWED_HOSTS') else []
```

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
