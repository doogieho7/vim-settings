#!/bin/sh
CUR_DIR=$PWD

#for ctags
rm -f tags cscope.*

#add KBUILD_SRC for absolute path
make tags ARCH=arm -e KBUILD_SRC=$PWD
make cscope ARCH=arm -e KBUILD_SRC=$PWD
