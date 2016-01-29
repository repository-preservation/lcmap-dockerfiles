FROM usgseros/debian-lfe
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get install -y libpam0g-dev

RUN cd /root/.lfe/lib && \
      git clone https://github.com/lfex/lfest.git && \
      cd lfest && \
      make compile

ENV ERL_LIBS=$ERL_LIBS:/root/.lfe/lib/lfest
