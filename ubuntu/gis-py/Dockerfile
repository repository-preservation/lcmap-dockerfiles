FROM usgseros/ubuntu-gis:0.5.0
MAINTAINER USGS LCMAP http://eros.usgs.gov

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PYTHONIOENCODING UTF-8

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y python python-dev python3 python3-dev
RUN apt-get install -y python-gdal python3-gdal python-otb
RUN apt-get install -y python-scipy python-numpy python-pyproj python-h5py \
    python3-scipy python3-numpy python3-pyproj python3-h5py

