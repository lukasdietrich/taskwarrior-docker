
# Taskwarrior for Docker [![Docker Pulls](https://img.shields.io/docker/pulls/lukd/taskwarrior.svg)](https://hub.docker.com/r/lukd/taskwarrior/)

This is a docker image for the Taskwarrior
[Taskserver](https://github.com/GothenburgBitFactory/taskserver).

## Docker-Compose

```yaml
version: '2.2'

services:
  taskwarrior:
    container_name: taskwarrior
    image: lukd/taskwarrior

    ports:
      - "53589:53589"

    environment:
      - "TASKD_BITS=4096"
      - "TASKD_EXPIRATION=365"
      - "TASKD_ORGANIZATION=My Organization"
      - "TASKD_CN=taskd.example.com"
      - "TASKD_COUNTRY=SE"
      - "TASKD_STATE=Västra Götaland"
      - "TASKD_LOCALITY=Göteborg"

    volumes:
      - "./volumes/data:/data"
```

## Setup

```sh
$ docker exec -it taskwarrior /bin/sh
```

### Add Org + User

```sh
$ taskd add org Public
$ taskd add user Public User
$ cd ${TASKDDATA}/pki
$ ./generate.client User
```
