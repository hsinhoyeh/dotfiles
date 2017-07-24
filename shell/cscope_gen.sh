#!/bin/sh

/usr/local/bin/ctags -R $1 --exclude=.git --exclude=node_modules
find $1 -type f -name '*.py' \
    -o -name '*.java' \
    -o -name '*.[CH]' \
    -o -name '*.cpp' \
    -o -name '*.cc' \
    -o -name '*.c' \
    -o -name '*.cs' \
    -o -name '*.asp' \
    -o -name '*.hpp' \
    -o -name '*.go' \
    -o -name '*.swift' \
    -o -name '*.js' \
    > cscope.files
#
# -b: just build
# -q: create inverted index
cscope -b -q
#/usr/local/bin/pycscope.py cscope.files
