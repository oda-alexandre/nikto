# NIKTO

<img src="https://www.novainfosec.com/wp-content/uploads/2012/07/nikto-162x300.png" />


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequisites](#PREREQUISITESITES)
- [Install](#INSTALL)
- [Use](#USE)
- [License](#LICENSE)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/nikto/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/nikto/commits/master)


## INTRODUCTION

Docker image of :

- [nikto](https://cirt.net/Nikto2)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/nikto/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/nikto)


## PREREQUISITES

Use [docker](https://www.docker.com)


## INSTALL

```
docker run -ti --rm --name nikto -v ${HOME}:/home/nikto alexandreoda/nikto
```


## USE

```
sudo service tor start && sudo service privoxy start && nikto -h http://lesite.com -useproxy
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/nikto/blob/master/LICENSE)
