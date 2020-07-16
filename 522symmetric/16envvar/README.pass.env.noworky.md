noworky


https://stackoverflow.com/questions/49293967/how-to-pass-environment-variable-to-docker-compose-up


must have FIXINITTOHAVERUN=$FIXINITTOHAVERUN in .env file ..

FIXINITTOHAVERUN=yes dc up


FIXINITTOHAVERUN=yes docker-compose up

export FIXINITTOHAVERUN=yes; docker-compose up

