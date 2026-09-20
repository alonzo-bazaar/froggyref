#!/usr/bin/env sh
# this script is here only because I don't wanna run this command every time

# the "if" is to support shit like ./start-dev-env.sh --first-time
if [ $# != '0' ]; then
	sbcl --dynamic-space-size 4096 --load start-dev-env.lisp
else
	sbcl --load start-dev-env.lisp
fi
