#!/bin/bash -e

# install docker
on_chroot - <<EOF
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh 
usermod -aG docker ${FIRST_USER_NAME}
echo "installed docker"
EOF

# install Kubernetes
on_chroot << EOF
cd "/home/"
curl –fsSL https://github.com/k3s-io/k3s/releases/download/v1.20.2%2Bk3s1/k3s-airgap-images-arm64.tar  
curl –fsSL https://github.com/k3s-io/k3s/releases/download/v1.20.2%2Bk3s1/k3s-arm64  
curl –fsSL https://get.k3s.io/ -o k3s_install.sh 
EOF
