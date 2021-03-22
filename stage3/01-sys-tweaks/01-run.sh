#!/bin/bash -e

# install docker
on_chroot - <<EOF
echo "installing docker"
cd "/home/${FIRST_USER_NAME}"
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh 
usermod -aG docker ${FIRST_USER_NAME}
rm get-docker.sh
echo "installed docker"
EOF

# install Kubernetes
on_chroot << EOF
echo "downloading kubernetes binaries"
curl -fsSL -O https://github.com/k3s-io/k3s/releases/download/v1.20.4%2Bk3s1/k3s-airgap-images-arm64.tar 
curl -fsSL -O https://github.com/k3s-io/k3s/releases/download/v1.20.4%2Bk3s1/k3s-arm64 
curl -fsSL https://get.k3s.io/ -o k3s_install.sh
echo "kubernetes downloaded"
EOF

# enable pixhawk
on_chroot << EOF
echo "Enabling pixhawk"
cd "/lib/udev/rules.d"
curl -fsSL -O https://raw.githubusercontent.com/CopterExpress/clover/11d5da5db227b3ba637c08ac47a5bde2d0e68f2a/clover/config/99-px4fmu.rules
EOF


if grep -q '${FIRST_USER_NAME} ALL=NOPASSWD: ALL' ${ROOTFS_DIR}/etc/sudoers; then
    echo 'skip this step.'
else
    on_chroot << EOF
echo '${FIRST_USER_NAME} ALL=NOPASSWD: ALL' | EDITOR='tee -a' visudo
EOF
fi
