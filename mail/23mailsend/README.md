# Purpose

send mail using other docker in this 472dkrcollection

see     sftp://192.168.88.60/srv/dkr/472dkrcollection/23relaymail

# Instructions

## Build

docker-compose build

## Send mail

```
dc=docker-compose

dc up
make m7

```


# Troubleshooting

problem.
    ERROR: for mail21c_deb_1  Cannot start service deb: OCI runtime create failed: container_linux.go:344: starting container process caused "exec: \"/app/entry.sh\": permission denied": unknown

ans.
    on host, not in docker container.
    chmod +x entry.sh


# Reference

This is copied from https://github.com/dgleba/482dkrcollection/tree/master/debian-mail21