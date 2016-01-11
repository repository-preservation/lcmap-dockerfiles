FROM usgs-lcmap/debian-python
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get install -y bsdmainutils
COPY run.py run.py
ENTRYPOINT ["python3", "run.py"]
