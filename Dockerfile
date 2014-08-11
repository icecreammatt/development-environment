FROM ubuntu:14.04
MAINTAINER Matt Carrier

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
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

RUN npm install -g gulp bower tldr jshint forever

RUN curl -s https://storage.googleapis.com/golang/go1.2.2.linux-amd64.tar.gz | tar -C /usr/local -xz

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/go/bin:/usr/local/go/bin

RUN git clone https://github.com/icecreammatt/dotfiles --branch slim
RUN dotfiles/setup.sh

WORKDIR /home
