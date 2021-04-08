include include/compositor.inc

PACKAGECONFIG_append = " displayinfo playerinfo"

# snapshot implemented with userland support, not applicable on vc4graphics
PACKAGECONFIG_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', 'snapshot', d)}"

WPE_PLAYERINFO_DEP     = "gstreamer1.0"
WPE_SNAPSHOT_DEP       = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', 'userland', d)}"
WPE_WIFICONTROL_DEP    = "linux-firmware-bcm43430"

# Raspberry PI 3 has 4 cores, set to 4 for RPIs
WEBKITBROWSER_THREADEDPAINTING = "2"
