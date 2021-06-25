# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "WPE base image"
LICENSE = "MIT"

require recipes-core/images/core-image-base.bb

require ${@bb.utils.contains('DISTRO_FEATURES', 'container', 'wpe-image-container.inc', 'wpe-image.inc', d)}

IMAGE_FEATURES += " \
    hwcodecs \
    ssh-server-dropbear \
    package-management \
"

IMAGE_INSTALL_append = " \
	kernel-modules \
	xkeyboard-config \
"
