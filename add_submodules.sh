#!/bin/bash

add_submodule() {
    local SUBMOD
    local DEST
    SUBMOD=$1
    DEST=$2

    if [ -n "$DEST" ]; then
      DEST="./$DEST/$SUBMOD"
    else
      DEST="./plcs/$SUBMOD"
    fi

    if [ ! -d "$SUBMOD" ]; then
        git submodule add "git@github.com:pcdshub/$SUBMOD" "$DEST"
    else
        pushd "$DEST" || exit 1
        git fetch origin
        git reset --hard origin/master || echo "Failed to update $SUBMOD"
        popd > /dev/null || return
    fi
}

add_submodule lcls-plc-bergmann-kohzu
add_submodule lcls-plc-crixs-motion
add_submodule lcls-plc-crixs-vac
add_submodule lcls-plc-cvmi-motion
add_submodule lcls-plc-cvmi-vac
add_submodule lcls-plc-cxi-fms
# add_submodule lcls-plc-dev-pmps
# add_submodule lcls-plc-dev-pmps-subsystem
# add_submodule lcls-plc-dev-xrt-optics
add_submodule lcls-plc-dream-motion
add_submodule lcls-plc-dream-vac
# add_submodule lcls-plc-example-motion
# add_submodule lcls-plc-example-vac-interface
# add_submodule lcls-plc-example-vacuum-serial
add_submodule lcls-plc-ftl-leak-det
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
add_submodule lcls-plc-lamp-vac-1
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
add_submodule lcls-plc-mfx-spectrometer
add_submodule lcls-plc-mini-powermeter-calib
add_submodule lcls-plc-mrco-motion
add_submodule lcls-plc-mrco-vac
add_submodule lcls-plc-qrix-motion
add_submodule lcls-plc-qrix-vac
add_submodule lcls-plc-rix-sds-injector
add_submodule lcls-plc-rixs-optics
add_submodule lcls-plc-roving-spectrometer
add_submodule lcls-plc-sample-delivery-system
add_submodule lcls-plc-sxr-satt
# add_submodule lcls-plc-template-twincat-project
# add_submodule lcls-plc-template-vacuum
# add_submodule lcls-plc-test-ads
# add_submodule lcls-plc-test-btps-prototype
# add_submodule lcls-plc-test-el2212-evaluation
# add_submodule lcls-plc-test-m1l1-sat
# add_submodule lcls-plc-test-m2k2
# add_submodule lcls-plc-test-m2k4-m3k4
# add_submodule lcls-plc-test-m3k3-m4k3-m2l1-m3l1-sat
# add_submodule lcls-plc-test-m4k4-m5k4-dream-sat
# add_submodule lcls-plc-test-old-dev-arbiter
# add_submodule lcls-plc-test-pfeiffer-tc110
# add_submodule lcls-plc-test-tmo-motion-granite-3
add_submodule lcls-plc-tmo-motion
add_submodule lcls-plc-tmo-optics
add_submodule lcls-plc-tmo-spectrometer-motion
add_submodule lcls-plc-tmo-vac
add_submodule lcls-plc-txi-hxr-motion
add_submodule lcls-plc-txi-hxr-vac
add_submodule lcls-plc-txi-optics
add_submodule lcls-plc-txi-sxr-mot
add_submodule lcls-plc-txi-sxr-vac
add_submodule lcls-plc-vhs-01
add_submodule lcls-plc-vls-vac
add_submodule lcls-plc-xcs-liquid-jet
add_submodule lcls-plc-xcs-per-vac
add_submodule lcls-plc-xpp-jjslit-motion
add_submodule lcls-plc-xrt-optics
# add_submodule lcls-tmo-plc-led-test
# add_submodule lcls-tmo-ptm-test-vac

# Supporting modules:
SUPPORT=./support
add_submodule lcls-twincat-common-components "${SUPPORT}"
add_submodule lcls-twincat-general "${SUPPORT}"
add_submodule lcls-twincat-motion "${SUPPORT}"
add_submodule lcls-twincat-optics "${SUPPORT}"
add_submodule lcls-twincat-physics "${SUPPORT}"
add_submodule lcls-twincat-pmps "${SUPPORT}"
add_submodule lcls-twincat-vacuum "${SUPPORT}"
add_submodule lcls-twincat-vacuum-serialdrivers "${SUPPORT}"
# add_submodule lcls-twincat-vacuum-sim "${SUPPORT}"
# add_submodule lcls-twincat-vacuum-system-simulator "${SUPPORT}"
