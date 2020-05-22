# Simple debian to test sending email

This is a simple debian container with postfix installed to test sending a simple email.

I left comments in some of the files to keep a record of the things I tried.

# Instructions

## Build

docker-compose build

## Send mail

```
dc=docker-compose

dc up
make m7

```

# Notes

### Copy files out of container.

```

Copy files from container for viewing.

contnr=debian-smpl_deb_run_8299f6d1d712
src=$contnr:/etc/mail
out=/srv/file/test/tmp/etcmail-03
mkdir -p $out
docker cp $src $out


src=debian-smpl_deb_run_4c1313d4e230:/etc/postfix
out=/srv/file/test/tmp/etcpostfix
mkdir -p $out
docker cp $src $out


cd /srv/file/test/482dkrcollection ;  rsync -a debian-mail/ debian-mail-works04 ;  cd debian-mail


```

docker-compose down --remove-orphans --rmi all
