FROM usgs-lcmap/ubuntu-base
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get install -y libgsl0-dev libgsl0ldbl gsl-bin r-base r-recommended \
    libmatio-dev libmatio2 gfortran
RUN cd ~ && \
    mkdir -p bin && \
    echo 'install.packages("glmnet", repos = "http://cran.us.r-project.org")' > \
    ./bin/install-glmnet && \
    Rscript bin/install-glmnet

CMD echo TBD
