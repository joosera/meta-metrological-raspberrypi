SINK_SOC = "rpi"
AUTOTOOLS_SCRIPT_PATH = "${S}/${SINK_SOC_PATH}/westeros-sink"

CFLAGS_append = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', \
                     ' -DWESTEROS_PLATFORM_DRM -x c++', \
                     'i -DWESTEROS_PLATFORM_RPI -DWESTEROS_INVERTED_Y -DBUILD_WAYLAND -x c++ -I${STAGING_INCDIR}/interface/vmcs_host/linux', \
                     d)}"
