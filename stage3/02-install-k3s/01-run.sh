#!/bin/bash -e

# Get k3s install script
on_chroot << EOF
cd "/home/"
curl -sfL https://get.k3s.io > get-k3s.sh
EOF

# k3s script refuses to install on a non-running system so we patch it
on_chroot << EOF
cd "/home/"
echo "$(uname -m)"
sed -i '/verify_system$/d' get-k3s.sh
ARCH=aarch64 HAS_SYSTEMD=true sh get-k3s.sh
EOF

