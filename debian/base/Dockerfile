FROM debian:jessie
MAINTAINER USGS LCMAP http://eros.usgs.gov

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://httpredir.debian.org/debian jessie main contrib" > /etc/apt/sources.list
RUN echo "deb http://httpredir.debian.org/debian jessie-updates main contrib" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org jessie/updates main" >> /etc/apt/sources.list

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
