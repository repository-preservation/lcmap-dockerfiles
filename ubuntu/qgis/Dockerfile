FROM usgseros/ubuntu-gis-py
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get install -y --force-yes \
    qgis qgis-common qgis-server
RUN apt-get install -y --force-yes \
    qgis-plugin-grass qgis-plugin-grass-common \
    qgis-provider-grass qgis-providers qgis-providers-common \
    python-qgis python-qgis-common
RUN apt-get install -y --force-yes \
    libqgis-analysis2.12.1 libqgis-app2.12.1 \
    libqgis-core2.12.1 libqgis-customwidgets libqgis-gui2.12.1 \
    libqgis-networkanalysis2.12.1 \
    libqgis-server2.12.1 libqgispython2.12.1
RUN apt-get install -y --force-yes \
    grass-gui libqgisgrass7-2.12.1
