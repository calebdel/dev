#!/usr/bin/env bash

USER_NAME=<%= ENV['USER'] %>

# Take some things that normally get stored in $HOME
# and move them into /opt. This makes loading these
# files faster as they are stored locally, not on a
# vagrant sync'd folder

mkdir -p /opt
chown -R <%= Process.uid %>:<%= Process.gid %> /opt

sudo -u "$USER_NAME" bash <<eof

  for dir in gem npm; do
    mkdir -p /opt/\$dir
    rm    -f /home/${USER_NAME}/.\$dir
    ln    -s /opt/\$dir /home/$USER_NAME/.\$dir
  done

eof
