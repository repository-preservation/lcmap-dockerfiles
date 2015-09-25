TAG_PREFIX = usgs-lcmap

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean build-all

build-all: TBD

base:
	cd debian/base

clean:
	@-docker rm $(shell docker ps -a -q)
	@-docker rmi $(shell docker images -q --filter 'dangling=true')

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Debian
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

debian-base:
	docker build -t $(TAG_PREFIX)/debian-base debian/base

debian-py: debian-base
	docker build -t $(TAG_PREFIX)/debian-python $(TAG_PREFIX)/debian-base

debian-py-rest: debian-py
	docker build -t $(TAG_PREFIX)/debian-py-rest $(TAG_PREFIX)/debian-py

debian-erl: debian-base
	docker build -t $(TAG_PREFIX)/debian-erlang $(TAG_PREFIX)/debian-base

debian-lfe: debian-erl
	docker build -t $(TAG_PREFIX)/debian-lfe $(TAG_PREFIX)/debian-erlang

debian-lfe-rest: debian-lfe
	docker build -t $(TAG_PREFIX)/debian-lfe-rest $(TAG_PREFIX)/debian-lfe

debian-java: debian-base
	docker build -t $(TAG_PREFIX)/debian-java $(TAG_PREFIX)/debian-base

debian-clojure: debian-java
	docker build -t $(TAG_PREFIX)/debian-cloure $(TAG_PREFIX)/debian-java

debian-clj-rest: debian-clojure
	docker build -t $(TAG_PREFIX)/debian-clj-rest $(TAG_PREFIX)/debian-clojure

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
