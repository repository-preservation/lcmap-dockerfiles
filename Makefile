TAG_PREFIX = usgs-lcmap

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean build-all

build-all: rest

jmeter: debian-jmeter

rest: debian-rest ubuntu-rest

debian-rest: debian-py-rest debian-lfe-rest debian-clj-rest

ubuntu-rest: ubuntu-py-rest ubuntu-lfe-rest ubuntu-clj-rest

base: debian-base ubuntu-base centos-base

clean:
	@-docker rm $(shell docker ps -a -q)
	@-docker rmi $(shell docker images -q --filter 'dangling=true')

.PHONY: all build-all rest debian-rest ubuntu-rest centos-rest base clean \
base-build py py-rest erl lfe lfe-rest java clojure clj-rest \
debian-base debian-py debian-py-rest debian-erl debian-lfe debian-lfe-rest \
debian-java debian-clojure debian-clj-rest \
ubuntu-base ubuntu-py ubuntu-py-rest ubuntu-erl ubuntu-lfe ubuntu-lfe-rest \
ubuntu-java ubuntu-clojure ubuntu-clj-rest


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base-build:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-base $(SYSTEM)/base

py:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-python $(SYSTEM)/python

py-rest:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-py-rest $(SYSTEM)/py-rest

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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Debian
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

debian-base:
	@SYSTEM=debian make base-build

debian-py: debian-base
	@SYSTEM=debian make py

debian-py-rest: debian-py
	@SYSTEM=debian make py-rest

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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# TBD
