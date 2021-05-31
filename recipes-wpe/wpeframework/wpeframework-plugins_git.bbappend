PACKAGECONFIG_append = "\
    ${@bb.utils.contains('DISTRO_FEATURES', 'compositor', '${WPE_COMPOSITOR}', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', 'snapshot', d)} \
"

WPE_COBALT_STARBOARD_CONFIGURATION_INCLUDE = "third_party/starboard/wpe/rpi/configuration_public.h"
WPE_COMPOSITOR = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'compositor_wayland', 'compositor_rpi', d)}"
WPE_PLAYERINFO_DEP = "gstreamer1.0"
WPE_SNAPSHOT_DEP = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', 'userland', d)}"
WPE_WIFICONTROL_DEP = "linux-firmware-bcm43430"
