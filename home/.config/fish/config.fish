set    fish_greeting ""
set -x PATH $HOME/bin $PATH

# BYOBU (auto-launch)
if status --is-login; byobu-launcher
else if status --is-interactive

  # DIRENV
    eval (direnv hook fish)

  # CHRUBY
    source /usr/local/share/chruby/chruby.fish
    chruby ruby ^ /dev/null

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

    nvm use stable > /dev/null ^ /dev/null

  # STATUS MESSAGE
  dev-status

end
