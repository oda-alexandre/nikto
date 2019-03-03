# NIKTO

[![dockeri.co](https://dockeri.co/image/alexandreoda/nikto)](https://hub.docker.com/r/alexandreoda/nikto)


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [Utilisation](#UTILISATION)
- [License](#LICENSE)


## BADGES

[![version](https://images.microbadger.com/badges/version/alexandreoda/nikto.svg)](https://microbadger.com/images/alexandreoda/nikto)
[![size](https://images.microbadger.com/badges/image/alexandreoda/nikto.svg)](https://microbadger.com/images/alexandreoda/nikto")
[![build](https://img.shields.io/docker/build/alexandreoda/nikto.svg)](https://hub.docker.com/r/alexandreoda/nikto)
[![automated](https://img.shields.io/docker/automated/alexandreoda/nikto.svg)](https://hub.docker.com/r/alexandreoda/nikto)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de

- [nikto](https://cirt.net/Nikto2)

Mis à jour automatiquement dans le [docker hub public](https://hub.docker.com/r/alexandreoda/nikto).


## PREREQUIS

Installer [docker](https://www.docker.com)


## INSTALLATION

```
docker run -ti --rm --name nikto -v ${HOME}:/home/nikto alexandreoda/nikto
```


## UTILISATION

```
sudo service tor start && sudo service privoxy start && nikto -h http://lesite.com -useproxy
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/nikto/blob/master/LICENSE)
