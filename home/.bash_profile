#!/usr/bin/env bash

echo
echo ======================================

# direnv

  eval $(direnv hook bash)

# node / nvm

  source /opt/nvm/nvm.sh
  nvm use stable

# ruby / ruby-install / chruby

  source /usr/local/share/chruby/chruby.sh
  chruby ruby
  ruby -v

  # Wrap ruby-install so it doesn't store anything
  # in $HOME.
  #
  # Also switch to that ruby on install and install
  # bundler automatically

  ruby-install () {
    /usr/local/bin/ruby-install --src-dir /tmp --cleanup --rubies-dir /opt/rubies $@
    source /usr/local/share/chruby/chruby.sh
    chruby $@
    gem install bundle
  }


echo ======================================
echo
