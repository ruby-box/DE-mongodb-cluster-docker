#!/usr/bin/env sh

# Create mongodb user and group if they do not exist

if ! sudo /usr/bin/id -g mongodb &>/dev/null; then
  sudo /usr/sbin/groupadd -r mongodb
fi

# Create mongodb user if they do not exist and assign
# them to the mongodb group

if ! sudo /usr/bin/id mongodb &>/dev/null; then
  sudo /usr/sbin/useradd -M -r -g mongodb \
    -d /var/lib/mongo -s /bin/false \
    -c mongodb mongodb > /dev/null 2>&1
fi