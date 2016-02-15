FROM usgseros/ubuntu-gis-py
MAINTAINER USGS LCMAP http://eros.usgs.gov

# Python binary and source dependencies
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
        ca-certificates \
        language-pack-en \
        libcurl4-openssl-dev \
        libffi-dev \
        libsqlite3-dev \
        libzmq3-dev \
        sqlite3 \
        texlive-fonts-recommended \
        texlive-latex-base \
        texlive-latex-extra \
        zlib1g-dev && \
    apt-get clean

# Install the recent pip release
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python2 get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py && \
    pip2 --no-cache-dir install requests[security] && \
    pip3 --no-cache-dir install requests[security] && \
    rm -rf /root/.cache

# Install some dependencies.
RUN pip2 --no-cache-dir install ipykernel && \
    pip3 --no-cache-dir install ipykernel && \
    python2 -m ipykernel.kernelspec && \
    python3 -m ipykernel.kernelspec

RUN git clone https://github.com/jupyter/notebook.git /jupyter-notebook && \
    cd /jupyter-notebook && \
    git checkout 4.1.0

# For crying out loud, node? Really? C'mon, Jupyter ...
RUN BUILD_DEPS="nodejs-legacy npm" && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq $BUILD_DEPS
# Well, it looks like you get rid of it after installing bower ... so that's something
RUN npm install -g bower && \
    apt-get purge -y --auto-remove \
        -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $BUILD_DEPS

RUN pip3 install --no-cache-dir /jupyter-notebook && \
    pip3 install widgetsnbextension

RUN mkdir ~/notebooks
RUN mkdir ~/noteboook-profile

# Add a notebook profile.
RUN jupyter notebook --generate-config

EXPOSE 1078
ENTRYPOINT ["jupyter", \
            "notebook", \
            "--no-browser", \
            "-y", \
            "--ip=0.0.0.0", \
            "--notebook-dir=~/notebooks"]
CMD ["--port=1078", \
     "--log-level=INFO"]
