# NIKTO

<img src="https://www.novainfosec.com/wp-content/uploads/2012/07/nikto-162x300.png" />


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [Utilisation](#UTILISATION)
- [License](#LICENSE)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/nikto/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/nikto/commits/master)


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
