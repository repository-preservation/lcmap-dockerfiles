TAG_PREFIX = usgseros
DOCKERHUB_ORG = $(TAG_PREFIX)
VERSION = 0.5.0

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean build-all

build-all: rest

sample-docker-model-all: debian-docker-sample-process

jmeter-all: debian-jmeter

python-all: debian-py ubuntu-py

rest-all: debian-rest ubuntu-rest

debian-rest: debian-py-rest debian-lfe-rest debian-clj-rest

ubuntu-rest: ubuntu-py-rest ubuntu-lfe-rest ubuntu-clj-rest

java-all: debian-java ubuntu-java

clojure-all: debian-clj ubuntu-clj

gis-all: ubuntu-gis ubuntu-gis-java ubuntu-gis-clj ubuntu-gis-py ubuntu-gis-notebooks

base-all: debian-base ubuntu-base centos-base

clean:
	@-docker rm $(shell docker ps -a -q)
	@-docker rmi $(shell docker images -q --filter 'dangling=true')

publish-all: publish-py publish-java publish-clj publish-gis 

publish-py: python-all debian-publish-py ubuntu-publish-py

publish-java: java-all debian-publish-java

publish-clj: clojure-all debian-publish-clj

publish-gis: gis-all ubuntu-publish-gis ubuntu-publish-gis-py \
ubuntu-publish-gis-java ubuntu-publish-qgis \
ubuntu-publish-gis-clj ubuntu-publish-gis-notebooks \
debian-publish-gis

.PHONY: all build-all rest debian-rest ubuntu-rest centos-rest base clean \
base-build py py-rest erl lfe lfe-rest java clojure clj-rest \
debian-base debian-py debian-py-rest debian-erl debian-lfe debian-lfe-rest \
debian-java debian-clj debian-clj-rest \
ubuntu-base ubuntu-py ubuntu-py-rest ubuntu-erl ubuntu-lfe ubuntu-lfe-rest \
ubuntu-java ubuntu-clj ubuntu-clj-rest \
docker-sample-process debian-docker-sample-process \
ubuntu-gis ubuntu-qgis ubuntu-gis-py ubuntu-gis-clj \
ubuntu-publish-java ubuntu-publish-clj ubuntu-publish-gis ubuntu-publish-gis-clj

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Note that the format of these base/common targets is:
# 	$ docker build -t <final image tag> <Dockerfile parent directory>

base-build:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-base:$(VERSION) $(SYSTEM)/base

py:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-python:$(VERSION) $(SYSTEM)/python

py-rest:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-py-rest:$(VERSION) $(SYSTEM)/py-rest

docker-sample-process:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-docker-sample-process:$(VERSION) $(SYSTEM)/docker-sample-process

erl:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-erlang:$(VERSION) $(SYSTEM)/erlang

lfe:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-lfe:$(VERSION) $(SYSTEM)/lfe

lfe-rest:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-lfe-rest:$(VERSION) $(SYSTEM)/lfe-rest

java:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-java:$(VERSION) $(SYSTEM)/java

clj:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-clj:$(VERSION) $(SYSTEM)/clj

clj-rest:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-clj-rest:$(VERSION) $(SYSTEM)/clj-rest

base-jmeter:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-jmeter:$(VERSION) $(SYSTEM)/jmeter

base-gis:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-gis:$(VERSION) $(SYSTEM)/gis

base-qgis:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-qgis:$(VERSION) $(SYSTEM)/qgis

base-frag-gis:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-gis-$(TAG_FRAGMENT):$(VERSION) $(SYSTEM)/gis-$(TAG_FRAGMENT)

base-publish:
	@docker push $(DOCKERHUB_ORG)/$(REPO):$(VERSION)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Debian
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

debian-base:
	@SYSTEM=debian make base-build

debian-py: debian-base
	@SYSTEM=debian make py

debian-py-rest: debian-py
	@SYSTEM=debian make py-rest

debian-docker-sample-process: debian-py
	@SYSTEM=debian make docker-sample-process

debian-erl: debian-base
	@SYSTEM=debian make erl

debian-lfe: debian-erl
	@SYSTEM=debian make lfe

debian-lfe-rest: debian-lfe
	@SYSTEM=debian make lfe-rest

debian-java: debian-base
	@SYSTEM=debian make java

debian-clj: debian-java
	@SYSTEM=debian make clj

debian-clj-rest: debian-clj
	@SYSTEM=debian make clj-rest

debian-jmeter: debian-java
	@SYSTEM=debian make base-jmeter

debian-publish-base:
	@REPO=debian-base make base-publish

debian-publish-py:
	@REPO=debian-python make base-publish

debian-publish-java:
	-@REPO=debian-java make base-publish

debian-publish-clj:
	-@REPO=debian-clj make base-publish

debian-publish-clj-rest:
	-@REPO=debian-clj-rest make base-publish

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ubuntu-base:
	@SYSTEM=ubuntu make base-build

ubuntu-py: ubuntu-base
	@SYSTEM=ubuntu make py

ubuntu-py-rest: ubuntu-py
	@SYSTEM=ubuntu make py-rest

ubuntu-erl: ubuntu-base
	@SYSTEM=ubuntu make erl

ubuntu-lfe: ubuntu-erl
	@SYSTEM=ubuntu make lfe

ubuntu-lfe-rest: ubuntu-lfe
	@SYSTEM=ubuntu make lfe-rest

ubuntu-java: ubuntu-base
	@SYSTEM=ubuntu make java

ubuntu-clj: ubuntu-java
	@SYSTEM=ubuntu make clj

ubuntu-clj-rest: ubuntu-clj
	@SYSTEM=ubuntu make clj-rest

ubuntu-gis:
	@SYSTEM=ubuntu make base-gis

ubuntu-gis-py: ubuntu-gis
	@SYSTEM=ubuntu TAG_FRAGMENT=py make base-frag-gis

ubuntu-gis-notebooks: ubuntu-gis-py
	@SYSTEM=ubuntu TAG_FRAGMENT=notebooks make base-frag-gis

ubuntu-gis-java: ubuntu-gis
	@SYSTEM=ubuntu TAG_FRAGMENT=java make base-frag-gis

ubuntu-gis-clj: ubuntu-java
	@SYSTEM=ubuntu TAG_FRAGMENT=clj make base-frag-gis

ubuntu-qgis: ubuntu-gis-py
	@SYSTEM=ubuntu make base-qgis

ubuntu-publish-base:
	-@REPO=ubuntu-base make base-publish

ubuntu-publish-java:
	-@REPO=ubuntu-java make base-publish

ubuntu-publish-py:
	-@REPO=ubuntu-python make base-publish

ubuntu-publish-java:
	-@REPO=ubuntu-java make base-publish

ubuntu-publish-clj:
	-@REPO=ubuntu-clj make base-publish

ubuntu-publish-gis:
	-@REPO=ubuntu-gis make base-publish

ubuntu-publish-qgis:
	-@REPO=ubuntu-qgis make base-publish

ubuntu-publish-gis-py:
	-@REPO=ubuntu-gis-py make base-publish

ubuntu-publish-gis-notebooks:
	-@REPO=ubuntu-gis-notebooks make base-publish

ubuntu-publish-gis-java:
	-@REPO=ubuntu-gis-java make base-publish

ubuntu-publish-gis-clj:
	-@REPO=ubuntu-gis-clj make base-publish

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# TBD
