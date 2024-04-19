#!/bin/bash

# Set the paths to the cross-compilers
MUSL="/opt/x86_64-linux-musl-cross"
WASI_SDK="/opt/wasi-sdk"

rm -rf build && mkdir build && cd build


# Remove the files generated by the previous build to avoid conflicts
rm -rf CMakeFiles CMakeCache.txt cmake_install.cmake Makefile
cmake ../src
make


# Remove the files generated by the previous build to avoid conflicts
rm -rf CMakeFiles CMakeCache.txt cmake_install.cmake Makefile
cmake -DCOMPILE_TO_WASM=ON -DWASI_SDK_PATH=$WASI_SDK ../src
make --keep-going # Avoid stopping the build process if any target fails


# Remove the files generated by the previous build to avoid conflicts
#rm -rf CMakeFiles CMakeCache.txt cmake_install.cmake Makefile
#cmake -DCOMPILE_WITH_MUSL=ON -DMUSL_PATH=$MUSL ../src
#make


