#!/usr/bin/env bash
clear

cd scripts/amd
# clean up
echo "Clean up"
rm -rf test_glibc_old.out

# have dt9 figure it out
echo "Build test file"
/dt9/usr/bin/gcc \
  -L "/dt9/lib/x86_64-linux-gnu/" \
  -L "/dt9/lib64/x86_64-linux-gnu/" \
  -L "/dt9/usr/lib" \
  -L "/dt9/usr/lib64" \
  -I "/dt9/include" \
  -I "/usr/include" \
  -I "/usr/include/x86_64-linux-gnu" \
  -std=c11 \
  -o test_glibc_old.out \
  -v \
  test_glibc_old.c \
  ;

echo "Print shared object dependencies"
ldd ./test_glibc_old.out
./test_glibc_old.out

echo "Dump symbols"
objdump -T test_glibc_old.out | grep GLIBC_

# clean up
echo "Clean up"
rm -rf test_glibc_old_dt9.out

# link dt9 lib
echo "Build test file"
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
  -o test_glibc_old_dt9.out \
  -v \
  test_glibc_old.c \
  ;

echo "Print shared object dependencies"
ldd ./test_glibc_old_dt9.out
./test_glibc_old_dt9.out

echo "Dump symbols"
objdump -T test_glibc_old_dt9.out | grep GLIBC_
