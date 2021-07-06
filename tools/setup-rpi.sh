#!/usr/bin/env bash

echo_err() {
    echo "[ERROR] $1" >&2
}

echo_status() {
    echo "[INFO] $1"
}

append_to_file() {
    echo -e "$1" >> "$2"
}

create_bblayers_conf() {
    # Add the standard configuration options for bblayers file.
    echo 'POKY_BBLAYERS_CONF_VERSION = "2"' > conf/bblayers.conf
    echo 'BBPATH = "${TOPDIR}"' >> conf/bblayers.conf
    echo 'BBFILES ?= ""' >> conf/bblayers.conf
    
    local layer_list=(
        "poky/meta"
        "poky/meta-poky"
        "poky/meta-yocto-bsp"
        "meta-python2"
        "meta-openembedded/meta-filesystems"
        "meta-openembedded/meta-oe"
        "meta-openembedded/meta-multimedia"
        "meta-openembedded/meta-networking"
        "meta-openembedded/meta-python"
        "meta-wpe"
        "meta-wpe-restricted"
        "meta-raspberrypi"
        "meta-metrological-raspberrypi"
    )
    
    append_to_file 'BBLAYERS += " \' "$BUILD_DIR/conf/bblayers.conf"
    for layer in "${layer_list[@]}"; do
        if [[ -d "$SRC_DIR/$layer" ]]; then
            append_to_file "    $SRC_DIR/$layer \\ " "$BUILD_DIR/conf/bblayers.conf"
        else
            echo_err "Layer $layer not found in $SRC_DIR."
            return 1
        fi
    done
    append_to_file '"' "$BUILD_DIR/conf/bblayers.conf"
}

create_conf() {
    if [[ ( -f "$SRC_DIR/meta-metrological-raspberrypi/tools/rpi.conf" ) && ( ! -f "$BUILD_DIR/conf/rpi.conf" ) ]]; then
        cp "$SRC_DIR/meta-metrological-raspberrypi/tools/rpi.conf" "$BUILD_DIR/conf/"
        if ! grep -q 'require rpi.conf' "$BUILD_DIR/conf/local.conf"; then
            echo 'require rpi.conf' >> "$BUILD_DIR/conf/local.conf"
        fi
    else
        echo_err "Could not find $SRC_DIR/meta-metrological-raspberrypi/tools/vss.conf."
        exit 1
    fi
}

SCRIPT_DIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"
SRC_DIR="$SCRIPT_DIR/src"
BUILD_DIR_BASENAME="build-rpi-wpe"
BUILD_DIR="$SCRIPT_DIR/$BUILD_DIR_BASENAME"

if [[ ! -d $SRC_DIR ]]; then
    echo_err "Source directory $SRC_DIR not present"
    return 1
fi

# Source the baseline poky configuration file.
source "$SRC_DIR/poky/oe-init-build-env" $BUILD_DIR_BASENAME

# Do no regenerate the configuration files if they're already present.
if [[ ! -f conf/rpi.conf ]]; then
    create_bblayers_conf
    create_conf
fi

echo_status "You can now build the wpe rpi image:"
echo_status "    bitbake wpe-eglfs-image"
