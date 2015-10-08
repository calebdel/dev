#!/usr/bin/env bash

sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install -y fish

curl -sSL https://github.com/JeanMertz/chruby-fish/archive/v0.6.0.tar.gz | tar -zxvf -
cd chruby-fish-0.6.0 && make install
cd ..                && rm -r chruby-fish-0.6.0

chsh -s /usr/bin/fish <%= ENV['USER'] %>
