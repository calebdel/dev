#!/usr/bin/env bash

apt-get -y --force-yes install \
  software-properties-common \
  htop \
  wget \
  avahi-daemon \
  cowsay \
  sudo \
  mysql-client \
  libsqlite3-dev

################################################
# HEROKU
################################################

curl -sSL https://toolbelt.heroku.com/install-ubuntu.sh | sh

################################################
# DIRENV
################################################

apt-get install -y golang
git clone https://github.com/direnv/direnv
cd direnv && make install
cd ..     && rm -r direnv

################################################
# RUBY (CHRUBY / RUBY-INSTALL)
################################################

curl -sSL https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz | tar -zxvf -
cd ruby-install-0.5.0 && make install
cd ..                 && rm -r ruby-install-0.5.0

curl -sSL https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz | tar -zxvf -
cd chruby-0.3.9 && make install
cd ..           && rm -r chruby-0.3.9

################################################
# NODE / NVM
################################################

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | NVM_DIR=/opt/nvm bash
chown -R <%= Process.uid %>:<%= Process.gid %> /opt/nvm

################################################
# PIP
################################################

curl -sSL https://bootstrap.pypa.io/get-pip.py | python

################################################
# DOCKER
################################################

curl -sSL https://get.docker.com/ | bash -
pip install docker-compose
