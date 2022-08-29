add_submodule() {
    SUBMOD=$1
    if [ ! -d "$SUBMOD" ]; then
        git submodule add git@github.com:pcdshub/$SUBMOD
    else
        pushd $SUBMOD || exit 1
        git fetch
        git reset --hard origin/master || echo "Failed to update $SUBMOD"
        popd > /dev/null
    fi
}


add_submodule lcls-plc-bergmann-kohzu
add_submodule lcls-plc-crixs-motion
add_submodule lcls-plc-crixs-vac
add_submodule lcls-plc-cvmi-motion
add_submodule lcls-plc-cvmi-vac
add_submodule lcls-plc-dream-vac
add_submodule lcls-plc-hxx-vonhamos
add_submodule lcls-plc-kfe-arbiter
add_submodule lcls-plc-kfe-gatt
add_submodule lcls-plc-kfe-gmd-vac
add_submodule lcls-plc-kfe-motion
add_submodule lcls-plc-kfe-rix-motion
add_submodule lcls-plc-kfe-rix-vac
add_submodule lcls-plc-kfe-vac
add_submodule lcls-plc-kfe-xgmd-vac
add_submodule lcls-plc-lamp-lv17-motion
add_submodule lcls-plc-lamp-lv17-vac
add_submodule lcls-plc-lamp-motion
add_submodule lcls-plc-lamp-vac
add_submodule lcls-plc-las-bts
add_submodule lcls-plc-las-lps-01
add_submodule lcls-plc-lfe-arbiter
add_submodule lcls-plc-lfe-gem
add_submodule lcls-plc-lfe-motion
add_submodule lcls-plc-lfe-motion-kmono
add_submodule lcls-plc-lfe-optics
add_submodule lcls-plc-lfe-vac
add_submodule lcls-plc-mfx-be-lens-interlock
add_submodule lcls-plc-mfx-motion
add_submodule lcls-plc-mrco-motion
add_submodule lcls-plc-mrco-vac
add_submodule lcls-plc-qrix-motion
add_submodule lcls-plc-qrix-vac
add_submodule lcls-plc-rix-sds-injector
add_submodule lcls-plc-rixs-optics
add_submodule lcls-plc-roving-spectrometer
add_submodule lcls-plc-tmo-motion
add_submodule lcls-plc-tmo-optics
add_submodule lcls-plc-tmo-spectrometer-motion
add_submodule lcls-plc-tmo-vac
add_submodule lcls-plc-txi-hxr-vac
add_submodule lcls-plc-txi-optics
add_submodule lcls-plc-txi-sxr-vac
add_submodule lcls-plc-vls-vac
add_submodule lcls-plc-xcs-liquid-jet
add_submodule lcls-plc-xcs-per-vac
add_submodule lcls-plc-xpp-jjslit-motion
add_submodule lcls-plc-xrt-optics
add_submodule lcls-tmo-plc-led-test
add_submodule lcls_plc_kfe_gatt

# Oddly named ones:
add_submodule HOMS_XRT
add_submodule sample-delivery-system
add_submodule TMO_SQ1_PLC_files

# Test/source projects:
# add_submodule lcls-plc-sxr-satt
# add_submodule pmps-dev-subsysplc

# Template projects:
# VAC-PLC-TEMPLATE

# Aliases:
# add_submodule lcls-plc-liquid-jet (-> lcls-plc-xcs-liquid-jet)

# Supporting modules:
# add_submodule lcls-twincat-motion
# add_submodule lcls-twincat-general
# add_submodule lcls-twincat-motion
# add_submodule lcls-twincat-motion-example
# add_submodule lcls-twincat-optics
# add_submodule lcls-twincat-physics
# add_submodule lcls-twincat-pmps
# add_submodule lcls-twincat-review
# add_submodule lcls-twincat-template-project
# add_submodule lcls-twincat-vacuum
# add_submodule lcls-twincat-vacuum-old
# add_submodule lcls-twincat-vacuum-serialdrivers
# add_submodule lcls-twincat-vacuum-system-simulator