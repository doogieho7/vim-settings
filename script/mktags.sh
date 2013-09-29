#!/bin/sh
# ex) mkcscope.sh [SRC_ROOT]

CUR_DIR=$PWD

#delete prvious database file of ctags
rm -rf tags

#delete prvious database file of cscope
rm -rf cscope.files cscope.files.temp cscope.out

#generate cscope.files
find $CUR_DIR \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' \) -print > cscope.files.temp

#sort cscope.files
sort -o cscope.files cscope.files.temp

#generate databse file
ctags -L cscope.files
cscope -b -q -i cscope.files 
