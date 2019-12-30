#!/bin/bash

if [[ -z $1 ]]; then
    echo 'You should specify operation, e.g. start or stop'
    exit 0
elif [[ $1 = "start" ]]; then
    if [[ -z $2 ]]; then
        echo "MIGRATE=False" > .startup_env
        docker-compose up -d
    elif [[ $2 = "new" ]]; then
        echo "MIGRATE=True" > .startup_env
        docker-compose down -v
        docker-compose up --build -d
    elif [[ $2 = "dev" ]]; then
      echo -e "MIGRATE=False\nCS=True" > .startup_env
      docker-compose up --build -d
    else
        echo 'Invalid option!'
        exit 0
    fi
elif [[ $1 = "stop" ]]; then
    docker-compose stop
elif [[ $1 = "down" ]]; then
    docker-compose down
else
    echo 'Invalid operation! It should be one of the "start", "stop" or "down"'
    exit 0
fi
