RDEPS_EXTRA_append = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', 'gstreamer1.0-plugins-good-video4linux2 ', '', d)} \
    gstreamer1.0-omx \
    gstreamer1.0-plugins-bad-faad \
"
