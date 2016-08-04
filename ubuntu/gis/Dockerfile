FROM usgseros/ubuntu-base:0.5.0
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN echo deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu trusty main \
    >> /etc/apt/sources.list
RUN echo deb-src http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu trusty main \
    >> /etc/apt/sources.list
RUN echo deb http://qgis.org/ubuntugis/ trusty main \
    >> /etc/apt/sources.list
RUN echo deb-src http://qgis.org/ubuntugis/ trusty main \
    >> /etc/apt/sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 314DF160
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y libspatialite-dev libspatialite5
RUN apt-get install -y libgdal-dev
RUN apt-get install -y grass-core grass grass-dev
RUN apt-get install -y libgeos++-dev libgeos-dev
RUN apt-get install -y libgdal1-dev
RUN apt-get install -y gdal-bin libgdal-doc
RUN apt-get install -y postgis postgis-doc liblwgeom-dev
RUN apt-get install -y libotb-dev otb-bin
RUN apt-get install -y libossim1 libossim-dev ossim-core
