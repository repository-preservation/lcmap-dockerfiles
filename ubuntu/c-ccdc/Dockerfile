FROM usgs-lcmap/ubuntu-base
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get install -y libgsl0-dev libgsl0ldbl gsl-bin r-base r-recommended \
    libmatio-dev libmatio2 gfortran

ENV CCDC_BIN /root/bin
RUN mkdir $CCDC_BIN
RUN cd /root && \
    echo 'install.packages("glmnet", repos = "http://cran.us.r-project.org")' > \
    $CCDC_BIN/install-glmnet && \
    Rscript $CCDC_BIN/install-glmnet

RUN git clone https://github.com/USGS-EROS/lcmap-change-detection-c.git
RUN cd lcmap-change-detection-c && \
    git checkout cleanup && \
    BIN=$CCDC_BIN make

CMD echo TBD
