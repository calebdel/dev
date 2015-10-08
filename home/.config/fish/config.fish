# BYOBU (auto-launch)

  test -n "$BYOBU_WINDOW_NAME" -o -z "$TERM"; or byobu-launcher

# DIRENV

  eval (direnv hook fish)

# CHRUBY

  source /usr/local/share/chruby/chruby.fish

  function ruby-install
    /usr/local/bin/ruby-install --src-dir /tmp --rubies-dir /opt/rubies --cleanup $argv
    source /usr/local/share/chruby/chruby.fish
    chruby $argv
    gem install bundler
  end

# NVM

  function nvm
    bass source /opt/nvm/nvm.sh ';' nvm $argv
  end

  test (nvm current) = "none"; and nvm use  --delete-prefix stable
