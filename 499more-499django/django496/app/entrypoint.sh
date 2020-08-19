#!/bin/bash

# verify that Postgres is healthy before applying the migrations
# and running the Django development server

if [[ $DATABASE = "mysql" ]]
then
    echo "Waiting for mysql..."

    while ! nc -z $SQL_HOST 3306; do
      sleep 0.1
    done

    echo "mysql started"
fi

if [[ $MIGRATE = "True" ]]
then
    python manage.py makemigrations peter
    python manage.py migrate

    echo "from django.contrib.auth.models import User;\
        User.objects.create_superuser('admin', 'admin@example.com', 'adm432');\

    python manage.py collectstatic --no-input

    export MIGRATE="False"
fi

if [[ $CS = "True" ]]
then
  python manage.py collectstatic --no-input
fi

exec "$@"