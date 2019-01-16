# NIKTO

![nikto](https://raw.githubusercontent.com/oda-alexandre/nikto/master/img/logo-nikto.png) ![docker](https://raw.githubusercontent.com/oda-alexandre/nikto/master/img/logo-docker.png)


## INDEX

- [Build Docker](#BUILD)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [Utilisation](#UTILISATION)
- [License](#LICENSE)


## BUILD DOCKER

[![nikto docker build](https://img.shields.io/docker/build/alexandreoda/nikto.svg)](https://hub.docker.com/r/alexandreoda/nikto)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de [nikto](https://cirt.net/Nikto2) pour [Docker](https://www.docker.com), mis à jour automatiquement dans le [Docker Hub](https://hub.docker.com/r/alexandreoda/nikto/) public.


## PREREQUIS

Installer [Docker](https://www.docker.com)


## INSTALLATION

```
docker run -ti --rm --name nikto -v ${HOME}:/home/nikto alexandreoda/nikto
```


## UTILISATION

Pour scanner un seveur copier/coller dans un terminal

```
sudo service tor start && sudo service privoxy start && nikto  -h http://lesite.com -useproxy
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/nikto/blob/master/LICENSE)
