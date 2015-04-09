FROM ubuntu:14.04
MAINTAINER Matt Carrier

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get upgrade -q -y \
    && apt-get install -q -y \
    cmake \
    make \
    g++ \
    vim \
    git \
    python-dev \
    htop \
    tmux \
    zsh \
    tree \
    curl \
    nodejs \
    npm \
    python-setuptools \
    && apt-get autoremove \
    && apt-get clean

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g gulp bower tldr jshint forever grunt

#RUN curl -s https://storage.googleapis.com/golang/go1.2.2.linux-amd64.tar.gz | tar -C /usr/local -xz
ENV GOLANG_VERSION 1.4.2
RUN curl -sSL https://golang.org/dl/go1.4.2.src.tar.gz \
        | tar -v -C /usr/src -xz

RUN cd /usr/src/go/src && ./make.bash --no-clean 2>&1

RUN mkdir -p /go/src
ENV GOPATH /go
ENV GOROOT /usr/src/go
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/go/bin:/usr/local/go/bin
ENV PATH /usr/src/go/bin:$PATH

RUN git clone https://github.com/icecreammatt/dotfiles --branch slim /root/dotfiles
RUN git clone https://github.com/icecreammatt/scripts /root/scripts

RUN /root/dotfiles/setup.sh
#RUN dotfiles/setup.sh

WORKDIR /home
