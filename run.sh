#!/usr/bin/env sh
# small hack from
# https://asdf.common-lisp.dev/asdf/Configuring-ASDF-to-find-your-systems-_002d_002d_002d-old-style.html
THIRDPARTY="$(dirname $0)/thirdparty"
export LD_LIBRARY_PATH="${THIRDPARTY}/claw-raylib/lib:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="${THIRDPARTY}/raylib-5.5_linux_amd64/lib:${LD_LIBRARY_PATH}"
sbcl\
    --dynamic-space-size 4096\
    --eval "(require \"asdf\")"\
    --eval "(push \"$(pwd)/thirdparty/claw-raylib/\" asdf:*central-registry*)"\
    --load main.lisp
