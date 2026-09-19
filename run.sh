#!/usr/bin/env sh
# small hack from
# https://asdf.common-lisp.dev/asdf/Configuring-ASDF-to-find-your-systems-_002d_002d_002d-old-style.html
sbcl\
    --dynamic-space-size 4096\
    --eval "(require \"asdf\")"\
    --eval "(push \"$(pwd)/thirdparty/claw-raylib/\" asdf:*central-registry*)"\
    --load main.lisp
