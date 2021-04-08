# WPE needs mpg123 gstreamer plugin
LICENSE_FLAGS_WHITELIST += "commercial_mpg123"
LICENSE_FLAGS_WHITELIST += "commercial_gstreamer1.0-plugins-ugly"

LICENSE_FLAGS_WHITELIST += "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', 'commercial_gstreamer1.0-libav', '', d)}"

# WPE needs gstreamer plugins that need faad2
LICENSE_FLAGS_WHITELIST += "commercial_faad2"

# WPE on rpi needs the OpenMAX gstreamer plugin 
LICENSE_FLAGS_WHITELIST += "commercial_libomxil" 
LICENSE_FLAGS_WHITELIST += "commercial_gstreamer1.0-omx"


