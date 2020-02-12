# NIKTO

<img src="https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904458/unnamed.png" width="200" height="200"/>

## INDEX

- [NIKTO](#nikto)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
  - [LICENSE](#license)

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

```docker run -ti --rm --name nikto -v ${HOME}:/home/nikto alexandreoda/nikto```

## USE

```sudo service tor start && sudo service privoxy start && nikto -h http://lesite.com -useproxy```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/nikto/blob/master/LICENSE)
