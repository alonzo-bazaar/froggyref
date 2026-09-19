# dependencies
## build time
that you have to install yourself
- sbcl
- a c compiler (preferably gcc)
downloaded during compilation
- [raylib]( https://github.com/raysan5/raylib/)
- [claw-raylib](https://github.com/bohonghuang/claw-raylib)

## run time
- sbcl
- bourne shell (temporary)

# building
> **NOTE:** current build process only works on linux :(
> I'm getting this to work first and then I'll work on making it not suck

so you first go in the `tools/` directory and compile `shsl.c` like
```sh
cc -o shsl shsl.c
```
then you go back to the root and run `./build.shsl` which will
- create a `thirdparty/` directory
- download `raylib-5.5` to the `thirdparty/` directory
- download `claw-raylib` (branch prebuilt-5.5) to the `thirdparty/` directory

# running
to run you run with the `./run.sh` shell script
I'm working on not needing this because I fucking hate the reasons for which I need it, but I currently need it :(, long story short *FUCK* dynamic libraries

this will set some environment variables then run `sbcl` on `main.lisp`  
`main.lisp` just runs the fucking thing

> **NOTE:** this currently only runs the example code from the `claw-raylib` README, there is no pureref code atm, at the moment I'm just setting shit up
