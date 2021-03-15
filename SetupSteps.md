# Setup Steps

This is from a fresh installation of Ubuntu 20.04.3 (64-bit) on the RasPi4.

Install docker: `sudo apt install docker.io`

Add a config file. e.g.:
```
IMG_NAME=RaspbianStarling64
TARGET_HOSTNAME=clover-23
WPA_ESSID=dronehub5g
WPA_COUNTRY=GB
ENABLE_SSH=1
```

Run `./build-docker.sh`

To run and preserve container for fixes:
`PRESERVE_CONTAINER=1 ./build-docker.sh`

To run and continue from previous build:
`PRESERVE_CONTAINER=1 CONTINUE=1 ./build-docker.sh`
