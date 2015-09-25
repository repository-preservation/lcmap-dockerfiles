FROM debian:latest
MAINTAINER USGS LCMAP <maintainers@lfe.io>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    ca-certificates \
    libcurl4-openssl-dev \
    curl \
    wget \
    git