TAG_PREFIX = usgs-lcmap

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean build-all

build-all: rest

rest: debian-py-rest debian-lfe-rest debian-clj-rest

base: debian-base ubuntu-base centos-base

clean:
	@-docker rm $(shell docker ps -a -q)
	@-docker rmi $(shell docker images -q --filter 'dangling=true')

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Debian
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

debian-base:
	docker build -t $(TAG_PREFIX)/debian-base debian/base

debian-py: debian-base
	docker build -t $(TAG_PREFIX)/debian-python debian/python

debian-py-rest: debian-py
	docker build -t $(TAG_PREFIX)/debian-py-rest debian/py-rest

debian-erl: debian-base
	docker build -t $(TAG_PREFIX)/debian-erlang debian/erlang

debian-lfe: debian-erl
	docker build -t $(TAG_PREFIX)/debian-lfe debian/lfe

debian-lfe-rest: debian-lfe
	docker build -t $(TAG_PREFIX)/debian-lfe-rest debian/lfe-rest

debian-java: debian-base
	docker build -t $(TAG_PREFIX)/debian-java debian/java

debian-clojure: debian-java
	docker build -t $(TAG_PREFIX)/debian-cloure debian/clojure

debian-clj-rest: debian-clojure
	docker build -t $(TAG_PREFIX)/debian-clj-rest debian/clj-rest

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# TBD

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# TBD
