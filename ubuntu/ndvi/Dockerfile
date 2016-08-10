FROM usgseros/ubuntu-gis-py
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get update
RUN apt-get install -y python3-nose python3-click python3-requests
RUN apt-get install -y python3-termcolor python3-dateutil
RUN apt-get install -y python3-pandas python3-zope.interface python3-tz
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
#RUN pip install lcmap-client
RUN pip install git+https://github.com/usgs-eros/lcmap-client-py

RUN useradd -ms /bin/bash science
USER    science
WORKDIR /home/science
COPY    science /home/science
WORKDIR /home/science

ENTRYPOINT ["/usr/bin/python3", "cli.py", "ndvi"]

