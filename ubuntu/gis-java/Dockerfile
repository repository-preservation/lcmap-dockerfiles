FROM usgseros/ubuntu-gis:0.5.0
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get update
RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y maven2
RUN apt-get install -y libxslt1.1 libxslt1-dev

RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections
RUN apt-get install -y oracle-java8-installer

RUN update-alternatives --auto java
ENV JAVA_HOME /usr/lib/jvm/jdk-8-oracle-x64
ENV JAVA_8_HOME /usr/lib/jvm/jdk-8-oracle-x64
ENV JAVA_7_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV PATH /usr/lib/jvm/jdk-8-oracle-x64/bin:$PATH
