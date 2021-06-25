require wpe-image.inc

ROOTFS_POSTPROCESS_COMMAND += "add_subuid_subgid_files;"

add_subuid_subgid_files() {
    if [ -f "${IMAGE_ROOTFS}${sysconfdir}/subuid" ]; then
        rm -rf "${IMAGE_ROOTFS}${sysconfdir}/subuid"
    fi
    if [ -f "${IMAGE_ROOTFS}${sysconfdir}/subgid" ]; then
        rm -rf "${IMAGE_ROOTFS}${sysconfdir}/subgid"
    fi
    touch "${IMAGE_ROOTFS}${sysconfdir}/subuid"
    echo "root:100000:65536" >"${IMAGE_ROOTFS}${sysconfdir}/subuid"
    touch "${IMAGE_ROOTFS}${sysconfdir}/subgid"
    echo "root:100000:65536" >"${IMAGE_ROOTFS}${sysconfdir}/subgid"
}

