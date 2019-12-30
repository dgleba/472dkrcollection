FROM python:3.7.5

WORKDIR /app

RUN apt-get update && apt-get install -y netcat

# install dependencies
RUN pip install --upgrade pip
RUN pip install pipenv
COPY ./Pipfile /usr/src/app/Pipfile
RUN pipenv install --skip-lock --system --dev

# copy project
COPY . /app

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]