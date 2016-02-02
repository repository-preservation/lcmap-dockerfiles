FROM usgseros/ubuntu-base
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

RUN apt-get install -y libgdal-dev libgdal-doc libgdal1h gdal-bin
RUN apt-get install -y grass-core grass-dev grass-doc
RUN apt-get install -y postgis postgis-doc liblwgeom-dev
RUN apt-get install -y libotb-dev otb-bin
RUN apt-get install -y libossim1 libossim-dev ossim-core \
    libotbossimadapters-5.2-1 libotbossimplugins-5.2-1
