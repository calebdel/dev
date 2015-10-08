function ruby-install
  /usr/local/bin/ruby-install \
    --rubies-dir  $CHRUBY_PATH/rubies \
    --src-dir     /tmp \
    --cleanup \
    $argv
end
