FROM usgseros/debian-base
MAINTAINER USGS LCMAP http://eros.usgs.gov

RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y maven2
RUN apt-get install -y java-package
RUN apt-get install -y libxslt1.1 libxslt1-dev

# make-jpkg doesn't let you run as root, so we need another user to do this:
RUN useradd -ms /bin/bash installer
RUN mkdir /home/installer/workbench
RUN chown installer /home/installer/workbench
WORKDIR /home/installer/workbench
# You need to download Oracle Java and accept the agreement manually, then save
# that file here (./debian/java/) in order to successfully run the next
# command.
COPY jdk-8u101-linux-x64.tar.gz .
RUN su installer -c 'yes | fakeroot make-jpkg jdk-8u101-linux-x64.tar.gz'

# Install Oracle Java 8
WORKDIR /
RUN dpkg -i /home/installer/workbench/oracle-java8-jdk_8u101_amd64.deb
RUN update-alternatives --auto java
ENV JAVA_HOME /usr/lib/jvm/jdk-8-oracle-x64
ENV JAVA_8_HOME /usr/lib/jvm/jdk-8-oracle-x64
ENV JAVA_7_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV PATH /usr/lib/jvm/jdk-8-oracle-x64/bin:$PATH

# Clean up
RUN rm -rf /home/installer/workbench
RUN deluser installer

