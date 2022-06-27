#!/bin/bash

podman run \
    --network=host \
    --volume=$PWD:/src/crt \
    -it \
    docker://ubuntu:20.04 \
    /bin/bash -c '
        cd /src/crt && \
        apt update && \
        DEBIAN_FRONTEND=noninteractive apt install -y \
            git \
            curl \
            build-essential \
            python-is-python3 \
            python3-pkg-resources \
            $(cat \
                third_party/mxe/apt-requirements.txt \
                third_party/qemu/apt-requirements.txt \
            ) && \
        ./bazelisk.sh build :release-artifacts
    '
