#!/usr/bin/env bash

USER_NAME=<%= ENV['USER'] %>
USER_UID=<%= Process.uid %>
USER_GID=<%= Process.gid %>


# staff on mac is gid 20
# gid 20 on ubuntu is dialout
# so let's sync them.

groupdel dialout
groupmod --gid "$USER_GID" staff


# add a user with matching uig, gid, and username
# from host system.

adduser \
  --shell /bin/bash \
  --no-create-home \
  --disabled-password \
  --gecos '' \
  --quiet \
  --uid "$USER_UID" \
  --gid "$USER_GID" \
  "$USER_NAME"


# give the user paswordless sudo access

echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/$USER_NAME"


# add the user to some additional groups

adduser "$USER_NAME" docker


# make ssh a little more secure

sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/'               /etc/ssh/sshd_config
sed -ri 's/^PasswordAuthentication\s+.*/PasswordAuthentication no/' /etc/ssh/sshd_config

