# LCMAP Dockerfiles

*Base Dockerfiles for LCMAP dev and testing*

## About

These are the ``Dockerfile``s that the LCMAP project is using for development
and testing of various services as well as the setting up of related
development environments. The Docker tag used for all of these images is
``usgs-lcmap``.

## Use

To create an image from any of the provided Dockerfiles, simple do the following:

```bash
$ docker build -t usgs-lcmap/debian-base debian/base
```

or

```bash
$ docker build -t usgs-lcmap/cenotos-py-rest centos/py-rest
```

There is also a ``Makefile`` for building images which depend upon other
``Dockerfile``s in this repo. Example usage:

```bash
$ make rest
```
