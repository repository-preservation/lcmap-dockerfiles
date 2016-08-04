FROM usgseros/ubuntu-gis-java:0.5.0
MAINTAINER USGS LCMAP http://eros.usgs.gov

ENV LEIN_ROOT ok
ENV LEIN /usr/local/bin/lein

RUN mkdir $LEIN_DOT
COPY profiles.clj $LEIN_DOT/
COPY fake-project.clj /project.clj

RUN curl -L -o $LEIN \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN chmod 755 $LEIN
RUN $LEIN deps
RUN rm project.clj

