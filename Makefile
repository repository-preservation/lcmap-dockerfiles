TAG_PREFIX = usgseros
DOCKERHUB_ORG = $(TAG_PREFIX)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean build-all

build-all: rest

ccdc: c-ccdc # clj-ccdc py-ccdc

c-ccdc: debian-c-ccdc ubuntu-c-ccdc

sample-docker-model: debian-docker-sample-process

jmeter: debian-jmeter

python: debian-py ubuntu-py

rest: debian-rest ubuntu-rest

debian-rest: debian-py-rest debian-lfe-rest debian-clj-rest

ubuntu-rest: ubuntu-py-rest ubuntu-lfe-rest ubuntu-clj-rest

base: debian-base ubuntu-base centos-base

clean:
	@-docker rm $(shell docker ps -a -q)
	@-docker rmi $(shell docker images -q --filter 'dangling=true')

publish: publish-c-ccdc publish-py

publish-c-ccdc: ccdc debian-publish-c-ccdc ubuntu-publish-c-ccdc

publish-py: python debian-publish-py ubuntu-publish-py

.PHONY: all build-all rest debian-rest ubuntu-rest centos-rest base clean \
base-build py py-rest erl lfe lfe-rest java clojure clj-rest \
debian-base debian-py debian-py-rest debian-erl debian-lfe debian-lfe-rest \
debian-java debian-clojure debian-clj-rest \
ubuntu-base ubuntu-py ubuntu-py-rest ubuntu-erl ubuntu-lfe ubuntu-lfe-rest \
ubuntu-java ubuntu-clojure ubuntu-clj-rest ccdc c-ccdc base-c-ccdc ubuntu-c-ccdc \
debian-c-ccdc docker-sample-process debian-docker-sample-process


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base-build:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-base $(SYSTEM)/base

py:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-python $(SYSTEM)/python

py-rest:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-py-rest $(SYSTEM)/py-rest

docker-sample-process:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-docker-sample-process $(SYSTEM)/docker-sample-process

erl:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-erlang $(SYSTEM)/erlang

lfe:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-lfe $(SYSTEM)/lfe

lfe-rest:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-lfe-rest $(SYSTEM)/lfe-rest

java:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-java $(SYSTEM)/java

clojure:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-clojure $(SYSTEM)/clojure

clj-rest:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-clj-rest $(SYSTEM)/clj-rest

base-jmeter:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-jmeter $(SYSTEM)/jmeter

base-c-ccdc:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-c-ccdc $(SYSTEM)/c-ccdc

base-publish:
	@docker push $(DOCKERHUB_ORG)/$(SYSTEM)

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

debian-clojure: debian-java
	@SYSTEM=debian make clojure

debian-clj-rest: debian-clojure
	@SYSTEM=debian make clj-rest

debian-jmeter: debian-java
	@SYSTEM=debian make base-jmeter

debian-c-ccdc: debian-py
	@SYSTEM=debian make base-c-ccdc

debian-publish-c-ccdc:
	@SYSTEM=debian-c-ccdc make base-publish

debian-publish-py:
	@SYSTEM=debian-python make base-publish

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

ubuntu-clojure: ubuntu-java
	@SYSTEM=ubuntu make clojure

ubuntu-clj-rest: ubuntu-clojure
	@SYSTEM=ubuntu make clj-rest

ubuntu-c-ccdc: ubuntu-py
	@SYSTEM=ubuntu make base-c-ccdc

ubuntu-publish-c-ccdc:
	@SYSTEM=ubuntu-c-ccdc make base-publish

ubuntu-publish-py:
	@SYSTEM=ubuntu-python make base-publish

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# TBD
