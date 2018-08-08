FROM debian:stable-slim
LABEL maintainer="TE-CHI LIU"


RUN apt-get update && apt-get install -y \
    curl \
    gnupg
RUN ["/bin/bash", "-c", "set -o pipefail && curl -sSL https://deb.nodesource.com/setup_9.x | bash -"]
# use node 10 fails
RUN apt-get update && apt-get install -y \
    ipython3 \
    python-pip \
    libczmq-dev \
    pkg-config \
    nodejs

# set env for pip install
RUN export LC_ALL=C
RUN pip install jupyter

ENV HOME /root
ENV SERVER_PORT 8888

# NOTE to edit files in host, do
# $ docker run -v "$PWD":/root/jupyter-nodejs [other options...]

# NOTE to edit files in container, uncomment this:
ADD . /usr/lib/jupyter-nodejs

WORKDIR /usr/lib/jupyter-nodejs

RUN mkdir -p $HOME/.ipython/kernels/nodejs/
RUN npm install && node install.js
RUN npm run build
RUN npm run build-ext

RUN ln -s $HOME/.jupyter $HOME/__dot_jupyter
ADD ./custom $HOME/.jupyter/custom

WORKDIR $HOME

EXPOSE $SERVER_PORT

CMD jupyter notebook --ip=0.0.0.0 --port=$SERVER_PORT --allow-root
#   config server: http://jupyter-notebook.readthedocs.io/en/stable/public_server.html
# CMD jupyter console --kernel nodejs

# CMD ["/usr/sbin/sshd", "-D"]
