WESTEROS_SOC_rpi = "${@bb.utils.contains("MACHINE_FEATURES", "vc4graphics", "westeros-soc-drm", "westeros-render-dispmanx", d)}"
