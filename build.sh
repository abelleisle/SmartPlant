#!/bin/zsh

#########################
#  VERSION DEFINITIONS  #
#########################

SP_VERSION="0.0.1"

###############
#  VARIABLES  #
###############

IMG_VERSION="smartplant:$SP_VERSION"

DOCKER_BUILD_CMD="docker build -t $IMG_VERSION ."
DOCKER_RUN_CMD="docker run -v $(pwd):/workdir $IMG_VERSION"

###############
#  FUNCTIONS  #
###############

install() {
    eval "$DOCKER_BUILD_CMD"
    eval "$DOCKER_RUN_CMD west update"
    eval "$DOCKER_RUN_CMD pip3 install -r os/zephyr/scripts/requirements.txt"
    eval "$DOCKER_RUN_CMD pip3 install -r os/bootloader/mcuboot/scripts/requirements.txt"
    eval "$DOCKER_RUN_CMD west blobs fetch"
}

shell() {
    eval "docker run -ti -v $(pwd):/workdir $IMG_VERSION"
}

flash() {
    eval "docker run -v $(pwd):/workdir --device=/dev/ttyUSB0 $IMG_VERSION sudo west flash --build-dir=firmware/build"
}

build() {
    eval "$DOCKER_RUN_CMD west build -b esp32 -s firmware"
}


##################
#  SWITCH ME UP  #
##################

case $1 in
    install)
        install
        ;;
    shell)
        shell
        ;;
    flash)
        flash
        ;;
    build)
        build
        ;;
    *)
        echo "Nop..."
        exit 1
esac
