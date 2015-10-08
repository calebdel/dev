#!/usr/bin/env bash

apt-add-repository -y ppa:fish-shell/release-2
apt-get update
apt-get install -y fish

curl -sSL https://github.com/JeanMertz/chruby-fish/archive/v0.6.0.tar.gz | tar -zxvf -
cd chruby-fish-0.6.0 && make install
cd ..                && rm -r chruby-fish-0.6.0

chsh -s /usr/bin/fish <%= ENV['USER'] %>
