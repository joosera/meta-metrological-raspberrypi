include include/compositor.inc

PACKAGECONFIG_append = " displayinfo playerinfo deviceinfo" 
PACKAGECONFIG_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', 'vc4graphics', '', d)}"

RDEPENDS_${PN}_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', 'userland', d)}"
