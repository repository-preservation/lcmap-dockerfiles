FROM usgseros/ubuntu-gis-py:0.5.0
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get install -y --force-yes \
    qgis qgis-common qgis-server
RUN apt-get install -y --force-yes \
    qgis-plugin-grass qgis-plugin-grass-common \
    qgis-provider-grass qgis-providers qgis-providers-common \
    python-qgis python-qgis-common
RUN apt-get install -y --force-yes \
    libqgis-analysis2.16.1 libqgis-app2.16.1 \
    libqgis-core2.16.1 libqgis-customwidgets libqgis-gui2.16.1 \
    libqgis-networkanalysis2.16.1 \
    libqgis-server2.16.1 libqgispython2.16.1
RUN apt-get install -y --force-yes \
    grass-gui libqgisgrass7-2.16.1
