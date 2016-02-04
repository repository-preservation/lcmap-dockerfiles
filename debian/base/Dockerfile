FROM debian:latest
MAINTAINER USGS LCMAP http://eros.usgs.gov

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    ca-certificates \
    libcurl4-openssl-dev \
    curl \
    wget \
    git

RUN apt-get update
RUN apt-get install --fix-missing
