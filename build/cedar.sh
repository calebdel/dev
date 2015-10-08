#!/usr/bin/env bash

DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y --force-yes install \
  autoconf \
  bind9-host \
  bison \
  build-essential \
  coreutils \
  curl \
  daemontools \
  dnsutils \
  ed \
  git \
  imagemagick \
  iputils-tracepath \
  language-pack-en \
  libbz2-dev \
  libcurl4-openssl-dev \
  libevent-dev \
  libglib2.0-dev \
  libjpeg-dev \
  libmagickwand-dev \
  libmysqlclient-dev \
  libncurses5-dev \
  libpq-dev \
  libpq5 \
  libreadline6-dev \
  libssl-dev \
  libxml2-dev \
  libxslt-dev \
  netcat-openbsd \
  openjdk-7-jdk \
  openjdk-7-jre-headless \
  openssh-client \
  openssh-server \
  postgresql-server-dev-9.3 \
  python \
  python-dev \
  ruby \
  ruby-dev \
  socat \
  syslinux \
  tar \
  telnet \
  zip \
  zlib1g-dev
