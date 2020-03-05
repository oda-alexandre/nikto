# NIKTO

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904458/unnamed.png)

## INDEX

- [NIKTO](#nikto)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/nikto/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/nikto/commits/master)

## INTRODUCTION

Docker image of :

- [nikto](https://cirt.net/Nikto2)

Continuous integration on :

- [gitlab pipelines](https://gitlab.com/oda-alexandre/nikto/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/nikto)

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

### DOCKER RUN

```docker run -ti --rm --name nikto -v ${HOME}:/home/nikto alexandreoda/nikto
```

### DOCKER COMPOSE

```yml
version: "3.7"

services:
  nikto:
    container_name: nikto
    image: alexandreoda/nikto
    restart: no
    privileged: false
    volumes:
      - "${HOME}:/home/nikto"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/nikto/blob/master/LICENSE)
