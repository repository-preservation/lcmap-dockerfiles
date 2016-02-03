FROM usgseros/ubuntu-gis
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get install -y openjdk-7-jdk maven2
RUN apt-get install -y libgdal-java libpostgis-java libpostgis-java-doc \
    libpostgis-java libpostgis-java-doc

ENV LEIN_ROOT ok
ENV LEIN_DOT /.lein
ENV LEIN /usr/local/bin/lein

RUN mkdir $LEIN_DOT
COPY profiles.clj $LEIN_DOT/
COPY fake-project.clj /project.clj

RUN curl -L -o $LEIN \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN chmod 755 $LEIN
RUN $LEIN deps
RUN rm project.clj

