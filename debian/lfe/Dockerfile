FROM usgs-lcmap/debian-erlang
MAINTAINER USGS LCMAP http://eros.usgs.gov

ENV LFE_HOME /opt/erlang/lfe
ENV ERL_LIBS $ERL_LIBS:$LFE_HOME:/root/.lfe/lib/ltest:/root/.lfe/lib/lutil:/root/.lfe/lib/lcfg
ENV PATH=$LFE_HOME/bin:$PATH

RUN mkdir -p /root/.lfe/lib      
RUN mkdir -p $LFE_HOME
RUN cd `dirname $LFE_HOME` && \
      git clone https://github.com/lfe/lfe.git && \
      cd $LFE_HOME && \
      git checkout color-shell-banner && \
      make compile && \
      make install

RUN curl -L -o ./lfetool https://raw.github.com/lfe/lfetool/dev-v1/lfetool && \
    bash ./lfetool install && \
    rm ./lfetool
RUN lfetool download deps

RUN cd /root/.lfe/lib && \
      git clone https://github.com/lfex/clj.git && \
      cd clj && \
      make compile