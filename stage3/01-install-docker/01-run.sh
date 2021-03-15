#!/bin/bash -e

# Setup the docker GPG key
on_chroot - <<EOF
sh -c 'curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg'
EOF

# Setup the docker repo
on_chroot - <<"EOF"
echo "deb [arch=arm64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian ${RELEASE} stable" >> /etc/apt/sources.list.d/docker.list
apt-get update
EOF
