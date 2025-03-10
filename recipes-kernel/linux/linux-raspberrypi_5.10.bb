LINUX_VERSION ?= "5.10.31"
LINUX_RPI_BRANCH ?= "rpi-5.10.y"
LINUX_RPI_KMETA_BRANCH ?= "yocto-5.10"

SRCREV_machine = "89399e6e7e33d6260a954603ca03857df594ffd3"
SRCREV_meta = "a19886b00ea7d874fdd60d8e3435894bb16e6434"

KMETA = "kernel-meta"

SRC_URI = "\
    git://github.com/raspberrypi/linux.git;name=machine;branch=${LINUX_RPI_BRANCH};protocol=https \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
    file://powersave.cfg \
"

SRC_URI_remove = "file://rpi-kernel-misc.cfg"

require recipes-kernel/linux/linux-raspberrypi.inc

KERNEL_DTC_FLAGS += "-@ -H epapr"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

