# template architecture

# deps, raison d'etre thereof, and some notes about em
## shsl
I just like it, it's cute, tho I should probably port `setup.shsl` to common lisp one of these days, if nothing else, for portability's sake

## asdf
lisp library management and build system thingy
I'm using the [old style](https://asdf.common-lisp.dev/asdf/Configuring-ASDF-to-find-your-systems-_002d_002d_002d-old-style.html) of telling it where am I putting shit
this is due to the fact this old style works best with my goals of having the development workspace be as hermetic as possible

## sly / slynk
I wanna run this thing from an emacs, meaning the containerized lisp must run a slynk server
below are documentation for how to
- install slynk (just have it somewhere your asdf can see)
- connect a containerized slynk to a running emacs/sly ([via tramp](see https://joaotavora.github.io/sly/#Connecting-to-a-remote-Lisp))
also docs for tramp, just in case

# running
run `sbcl --load startup.lisp`, this will
- load required libraries and shit
- start a slynk server at port `1234`
then, from emacs
- `M-x sly-connect` and enter the appropriate info (or leave the defaults if they work)

should also work from ecl, I hope
