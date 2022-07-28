#!/usr/bin/env bash

cd scripts/amd

/dt9/usr/bin/gcc \
  -L "/dt9/lib/x86_64-linux-gnu/" \
  -L "/dt9/lib64/x86_64-linux-gnu/" \
  -L "/dt9/usr/lib" \
  -L "/dt9/usr/lib64" \
  -I "/dt9/include" \
  -I "/usr/include" \
  -I "/usr/include/x86_64-linux-gnu" \
  -Wl,--rpath="/dt9/lib/x86_64-linux-gnu/" \
  -Wl,--dynamic-linker="/dt9/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2" \
  -std=c11 \
  -o test_glibc_old.out \
  -v \
  test_glibc_old.c \
;

ldd ./test_glibc_old.out
./test_glibc_old.out