# Purpose

send mail using ..\docker-smtp in this 472dkrcollection

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

ERROR: for mail21c_deb_1  Cannot start service deb: OCI runtime create failed: container_linux.go:344: starting container process caused "exec: \"/app/entry.sh\": permission denied": unknown

chmod +x entry.sh


#