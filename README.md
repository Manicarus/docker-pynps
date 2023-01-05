# docker-pynps
Dockerized pyNPS NoPayStation client

This image is based on python 3.8
A user is created with given PUID and PGID.

pynps pip package is installed and pkg2zip binary is compiled inside the image.

## Installation

Edit `docker-compose.yml' and change volume mapping according to your needs.

```
docker-compose build
docker-compose up --no-start

docker-compose run --rm pynps --help # print pynps command help
docker-compose run --rm pynps --update # update NoPayStation database
```

## NOTICE

I am no expert in programming Dockerfile.
I barely got this working in OpenMediaVault with numerous trial and errors.
