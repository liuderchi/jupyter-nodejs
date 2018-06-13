FROM ubuntu:16.04
LABEL maintainer="TE-CHI LIU"

RUN apt-get update && apt-get install -y curl
RUN ["/bin/bash", "-c", "set -o pipefail && curl -sSL https://deb.nodesource.com/setup_8.x | bash -"]
# NOTE use node 10 fails
RUN apt-get update && apt-get install -y \
    ipython3 \
    python-pip \
    libczmq-dev \
    pkg-config \
    nodejs \
    openssh-server

# set env for pip install
RUN export LC_ALL=C
RUN pip install jupyter


RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

ENV workdir /root/jupyter-nodejs
# NOTE use $HOME/jupyter-nodejs fails
ENV serverPort 3000

# NOTE to edit files in host, do
# $ docker run -v "$PWD":/root/jupyter-nodejs [other options...]

# NOTE to edit files in container, uncomment this:
ADD . ${workdir}

WORKDIR ${workdir}

RUN mkdir -p $HOME/.ipython/kernels/nodejs/
RUN npm install && node install.js
RUN npm run build
RUN npm run build-ext

EXPOSE ${serverPort}
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
# jupyter console --kernel nodejs
