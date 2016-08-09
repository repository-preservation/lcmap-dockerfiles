FROM usgseros/ubuntu-gis-py
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get install python3
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN pip install git+https://github.com/usgs-eros/lcmap-client-py
RUN pip install --upgrade pylru termcolor six requests nose click DateTime numpy


RUN useradd -ms /bin/bash science

USER    science
WORKDIR /home/science
COPY    science /home/science
WORKDIR /home/science/src/python
ENV     LD_LIBRARY_PATH /home/science/lib

CMD ["/usr/bin/python3", "index/cli.py", "ndvi"]

# ENTRYPOINT ["/usr/bin/python3", "index/cli.py", "ndvi"]
