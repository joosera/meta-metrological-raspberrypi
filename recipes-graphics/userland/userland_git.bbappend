PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"

