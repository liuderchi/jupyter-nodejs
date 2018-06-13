FROM ubuntu:16.04
LABEL maintainer="TE-CHI LIU"

# NOTE use node v9 from Dockerfile
#   https://github.com/notablemind/jupyter-nodejs/blob/master/Dockerfile
# README https://github.com/notablemind/jupyter-nodejs

ENV DEBIAN_FRONTEND=noninteractive
# do not stop on apt-get install
USER root

RUN apt-get update && apt-get install -y \
    wget \
    gnupg
RUN ["/bin/bash", "-c", "set -o pipefail && wget -O - https://deb.nodesource.com/setup_9.x | bash -"]
RUN apt-get install -y \
    nodejs \
    # jupyter \
    python2.7 \
    python-pip \
    python-dev \
    pkg-config

ENV workdir /root/jupyter-nodejs

ADD . ${workdir}

RUN mkdir -p $HOME/.ipython/kernels/nodejs/

# WIP
# issues to install zmq
# RUN apt-get install -y libzmq-dev

# RUN npm install
# RUN node install.js
# RUN npm run build
# RUN npm run build-ext

# TODO CMD jupyter console --kernel nodejs

EXPOSE 8888
